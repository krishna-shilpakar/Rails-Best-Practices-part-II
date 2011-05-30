# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


# sample users with addresses


#sample post

#create sample users
User.find_or_create_by(:login => "Matthew", :password => "matt", :password_confirmation => "matt")
User.find_or_create_by(:login => "Gregory", :password => "greg", :password_confirmation => "greg")
 User.first.posts.create(:title => "Hello World", :text => "My first blog post.")
 
 
user = User.first
user.create_address(:country=>"USA",:city => "NY")
user = User.last
user.create_address(:country=>"Canada",:city => "AB")