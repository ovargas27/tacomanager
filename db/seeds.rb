# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
User.create(:username => 'admin', :password => 'administrator1', :password_confirmation => 'administrator1', :email => 'taco.manager@gmail.com')
admin = User.find_by_username('admin')
UserPrivilege.create(:user_id => admin.id, :privilege => 'Admin')
