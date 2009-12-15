class CreateProductInOrders < ActiveRecord::Migration
  def self.up
    create_table :product_in_orders do |t|
      t.integer :product_id
      t.integer :order_id
      t.integer :quantity
      t.datetime :created_at

      t.timestamps
    end
  end

  def self.down
    drop_table :product_in_orders
  end
end
