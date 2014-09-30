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
  User.create( f_name: 'Elon', l_name:'Musk', email: 'elonmusk', password: 'apples')
  User.create( f_name: 'Walter', l_name:'White', email: 'heisenberg', password: 'apples')
  User.create( f_name: 'Tony', l_name:'Stark', email: 'ironman', password: 'apples')
  b1 = Boat.new( name: 'Popeye', lat: 37.8211, long: -122.3759, price: '100', style: 'Budget', size: '4', user_id: 1, tagline: 'A small boat')
  b1.description = "This is a wonderfully small boat. If you like a cozy and well furnished yacht, this is the one for you!"
  b1.images.build(filepicker_url: 'https://www.filepicker.io/api/file/4qd0BKblSyet17bAINNp')
  b1.save!
  b2 = Boat.new( name: 'Trails', lat: 37.8235, long: -122.517, price: '100', style: 'Budget', size: '4', user_id: 2, tagline: 'Trailing through sf', featured: true)
  #white yacht
  b2.images.build(filepicker_url: 'https://www.filepicker.io/api/file/z6cSwAMS9KtMUwIWtkAb')
  b2.save!
  b3 = Boat.new( name: 'Bikester', lat: 37.8585, long: -122.5784, price: '600', style: 'Budget', size: '8', user_id: 3, tagline: 'biking on the ocean')
  #black boat
  b3.images.build(filepicker_url: 'https://www.filepicker.io/api/file/b7QQvsqpR8iSMpK8Z3D4')
  b3.save!
  b4 = Boat.new( name: 'Motorboat', lat: 37.8070, long: -122.3995, price: '1000', style: 'Luxury', size: '10', user_id: 3, tagline: 'the fastest thing around')
  #white yacht
  b4.images.build(filepicker_url: 'https://www.filepicker.io/api/file/IQBjaCTFqrYdt7MFo5DA')
  b4.save!
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 1, renter_id: 2)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 2, renter_id: 1)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 3, renter_id: 1)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 3, renter_id: 2)
end
