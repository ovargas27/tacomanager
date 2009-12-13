class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :vendor_id
end
