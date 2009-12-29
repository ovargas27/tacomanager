# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
User.create(:username => 'admin', :password => 'administrator1', :password_confirmation => 'administrator1', :email => 'taco.manager@gmail.com')
admin = User.find_by_username('admin')
UserPrivilege.create(:user_id => admin.id, :privilege => 'Admin')
Vendor.create(:name => 'Don_rafa', :phone => '312-5323', :description => 'Tacos tuxpeños', :shipping_cost => '1' )
dr = Vendor.find(1)
Product.create(:name => 'Carne', :description => 'Taco de tuxpeño', :price => '6.50', :vendor => dr)
Product.create(:name => 'Chicharron', :description => 'Taco de tuxpeño', :price => '6.50', :vendor => dr)
Product.create(:name => 'Frijoles', :description => 'Taco de tuxpeño', :price => '6.50', :vendor => dr)
Product.create(:name => 'Papas', :description => 'Taco de tuxpeño', :price => '6.50', :vendor => dr)
