class Product < ActiveRecord::Base
  belongs_to :vendor
  has_many :product_in_orders
  has_many :orders, :through => :product_in_orders

end
