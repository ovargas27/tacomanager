class Order < ActiveRecord::Base
  belongs_to :user  
  has_and_belongs_to_many :products  

  def self.new_order(params) 
debugger
    products = Product.find(params[:products])
    params[:order][:sub_total] = products.collect(&:price).sum
    params[:order][:shipping_cost] = 10
    params[:order][:total] =  params[:order][:sub_total] +  params[:order][:shipping_cost]
    order = Order.new(params[:order])
    order.products = products
    order.save
debugger
    order
  end
end
