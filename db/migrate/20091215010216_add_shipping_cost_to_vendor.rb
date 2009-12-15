class AddShippingCostToVendor < ActiveRecord::Migration
  def self.up
    add_column :vendors, :shipping_cost, :decimal
  end

  def self.down
    remove_column :vendors, :shipping_cost
  end
end
