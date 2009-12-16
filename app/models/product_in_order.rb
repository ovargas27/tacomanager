class ProductInOrder < ActiveRecord::Base
  belongs_to :product
  belongs_to :order 
  
  validates_presence_of :product
  validates_presence_of :order 
  validates_numericality_of :quantity, :greater_than_or_equal_to => 0, :less_than => 20

end
