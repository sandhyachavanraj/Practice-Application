# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@user = User.create(:email => "admin@gmail.com", :password => "adminpassword", :admin => true, :role => :admin)
@user.create_user_profile(:user_name => "Admin", :address => "Mumbai", :mobile_number => 9658745632, :company => "Sumeru")