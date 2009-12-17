# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
User.create(:username => 'admin', :password => 'administrator', :password_confirmation => 'administrator', :email => 'taco.manager@gmail.com')
admin = User.find_by_username('admin')
UserPrivilege.create(:user_id => admin.id, :privilege => 'Admin')
Vendor.create(:name => 'Bacteria', :phone => '000-0000', :description => 'tortas', :shipping_cost => '1' )
bacte = Vendor.find_by_name('Bacteria')
Product.create(:name => 'Bacte-Torta', :description => 'Torta de carne', :price => '24.0', :vendor => bacte)
