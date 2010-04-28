class OrdersController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update, :destroy]
  before_filter :require_admin, :only => [:index]
  before_filter :load_order, :only => [:new, :show, :edit, :update, :destroy]
  before_filter :require_be_owner, :only => [:show, :edit, :update, :destroy]
  before_filter :load_random_vendor, :only => [:new, :edit]
  before_filter :load_products, :only =>[:new, :edit ]

  def index
    today_start = Time.zone.now.strftime("%Y-%m-%d") + " 00:00:00" 
    today_end = Time.zone.now.strftime("%Y-%m-%d") + " 23:59:59" 
    @orders = Order.find(:all, :conditions => ["(created_at >= '#{today_start}' AND created_at <= '#{today_end}' )"])
    @total = @orders.collect{|order| order.total}.sum    
  end
  
  def show
  end
  
  def new
    
  end
  
  def create
    params[:order][:user_id] = current_user.id   
    @order = Order.new_order(params)
    if @order
      flash[:notice] = "Successfully created order."
      redirect_to @order
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update   
    if @order.update_order(params)
      flash[:notice] = "Successfully updated order."
      redirect_to @order
    else
      render :action => 'edit'
    end
  end
  
  def destroy    
    @order.destroy
    flash[:notice] = "Successfully destroyed order."
    redirect_to orders_url
  end

private
  def load_order
    if params.nil? or params[:id].nil?
      @order = Order.new(:state => 'pending')
    else
      @order = Order.find(params[:id])
    end
  end

  def load_products
    @products = []
    vendor_products = @vendor.products
    order_product_ids = []
    vendor_product_ids = []
    order_product_ids = @order.product_in_orders.collect(&:product_id) unless @order.product_in_orders.empty?
    vendor_product_ids = vendor_products.collect(&:id)
    vendor_product_ids -= order_product_ids
    @order.product_in_orders.each do |product|
      @products << ProductInOrder.new(:product_id => product.product_id, :quantity => product.quantity )
    end
    vendor_product_ids.each do |product_id|
      @products << ProductInOrder.new(:product_id => product_id, :quantity => 0 )
    end
    @quantities = []
    19.times do |i|
      @quantities << i +1
    end
  end

  def load_random_vendor
    # vendor_id = rand(Vendor.count)
    @vendor = Vendor.find(1)
  end

  def require_be_owner
    unless current_user.is_admin? or current_user.id == @order.user.id
      store_location
      flash[:notice] = "You must be the order owner to access this page"
      redirect_to root_url
      return false
    end
  end

end
