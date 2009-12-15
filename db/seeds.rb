# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
User.create(:username => 'admin', :password => 'administrator', :password_confirmation => 'administrator', :email => 'omar.vargas@crowdint.com')
admin = User.find_by_username('admin')
UserPrivilege.create(:user_id => admin.id, :privilege => 'Admin')
