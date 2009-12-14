class CreateOrdersProductsJoin < ActiveRecord::Migration
  def self.up
    create_table 'orders_products', :id => false do |t|
      t.column 'order_id', :integer      
      t.column 'product_id', :integer
    end
  end

  def self.down
    drop_table'orders_products'
  end
end
