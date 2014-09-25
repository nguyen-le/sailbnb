# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ActiveRecord::Base.transaction do 
  User.create( f_name: 'Guest', l_name:'Guester', email: 'guest', password: 'apples')
  User.create( f_name: 'John', l_name:'Doe', email: 'johndoe', password: 'apples')
  User.create( f_name: 'Jane', l_name:'Doe', email: 'janedoe', password: 'apples')
  Boat.create( name: 'Popeye', location: 'SF', price: '100', size: '3', user_id: 1)
  Boat.create( name: 'Trails', location: 'SF', price: '100', size: '3', user_id: 2)
  Boat.create( name: 'Bikester', location: 'SF', price: '600', size: '6', user_id: 3)
  Boat.create( name: 'Motorboat', location: 'SF', price: '1000', size: '10', user_id: 3)
end
