class Order < ActiveRecord::Base
  belongs_to :user  
  has_many :product_in_orders
  has_many :products, :through => :product_in_orders

  validates_numericality_of :subtotal
  validates_numericality_of :total
  validates_numericality_of :shipping_cost
  validates_presence_of :user

  def self.new_order(params) 
    order = Order.new(params[:order])
    Order.save_order(order, params)
  end

  def update_order(params)  
    Order.save_order(self, params)    
  end

  def self.save_order(order, params)
    params_products = params[:products].collect{ |p| p unless p.nil? }
    params_products.delete_if {|i| i.nil? or i[:product_id].nil? }      
    
    order.product_in_orders.clear
    params_products.each do |param|
      order.product_in_orders << order.product_in_orders.new(param)
    end

    order.sub_total = order.product_in_orders.collect{ |product| product.quantity * product.product.price}.sum
    order.shipping_cost = 1
    order.total = order.sub_total + order.shipping_cost
    order.state = params[:order][:state]
    order.save
    order
  end
end
