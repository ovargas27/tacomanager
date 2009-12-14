class OrdersController < ApplicationController
  before_filter :require_user
  before_filter :load_order, :only => [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end
  
  def show
  end
  
  def new
    @order = Order.new
    @order.products = Product.find(:all, :conditions => ["vendor_id = ?", 1])
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
debugger
    @order.products = Product.find(params[:products])
    if @order.update_attributes(params[:order])
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
    @order = Order.find(params[:id])
  end

end
