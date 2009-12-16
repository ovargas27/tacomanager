class Vendor < ActiveRecord::Base
  has_many :products
  
  validates_presence_of :name
  validates_presence_of :description
  validates_numericality_of :shipping_cost
  validates_length_of :phone, :minimum => 7, :too_short => "The phone number must be at least 7 numbers."
  validates_length_of :phone, :maximum => 15, :too_short => "The phone number must be max 15 numbers."
# Pending  validates_format_of :phone, :with =>  /\((\d{3})\)\s+(\d{3})-(\d{4})/ 
  
end
