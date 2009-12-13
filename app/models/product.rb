class Product < ActiveRecord::Base
  belongs_to :vendor
  attr_accessible :name, :description, :price, :vendor_id
end
