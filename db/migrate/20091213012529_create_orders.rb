class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.decimal :sub_total
      t.decimal :total
      t.decimal :shipping_cost
      t.string :state
      t.integer :user_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :orders
  end
end
