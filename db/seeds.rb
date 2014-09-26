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
  b1 = Boat.new( name: 'Popeye', location: 'SF', price: '100', size: '3', user_id: 1)
  b1.images.build(filepicker_url: 'https://www.filepicker.io/api/file/4qd0BKblSyet17bAINNp')
  b1.save!
  b2 = Boat.new( name: 'Trails', location: 'SF', price: '100', size: '3', user_id: 2)
  #white yacht
  b2.images.build(filepicker_url: 'https://www.filepicker.io/api/file/z6cSwAMS9KtMUwIWtkAb')
  b2.save!
  b3 = Boat.new( name: 'Bikester', location: 'SF', price: '600', size: '6', user_id: 3)
  #black boat
  b3.images.build(filepicker_url: 'https://www.filepicker.io/api/file/b7QQvsqpR8iSMpK8Z3D4')
  b3.save!
  b4 = Boat.new( name: 'Motorboat', location: 'SF', price: '1000', size: '10', user_id: 3)
  #white yacht
  b4.images.build(filepicker_url: 'https://www.filepicker.io/api/file/IQBjaCTFqrYdt7MFo5DA')
  b4.save!
end
