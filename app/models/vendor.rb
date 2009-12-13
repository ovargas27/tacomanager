class Vendor < ActiveRecord::Base
  has_many :products
  attr_accessible :name, :phone, :description
end
