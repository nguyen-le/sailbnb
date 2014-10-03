ActiveRecord::Base.transaction do
  User.create!( f_name: 'Guest', l_name:'Guester', email: 'guest', password: 'apples')
  User.create!( f_name: 'John', l_name:'Doe', email: 'johndoe', password: 'apples')
  User.create!( f_name: 'Jane', l_name:'Doe', email: 'janedoe', password: 'apples')
  User.create!( f_name: 'Elon', l_name:'Musk', email: 'elonmusk', password: 'apples')
  User.create!( f_name: 'Walter', l_name:'White', email: 'heisenberg', password: 'apples')
  User.create!( f_name: 'Tony', l_name:'Stark', email: 'irohman', password: 'apples')
  User.create!( f_name: 'Jesse', l_name:'Pinkman', email: 'jessepinky', password: 'apples')
  User.create!( f_name: 'David', l_name:'Hansson', email: 'dhh', password: 'apples')
  User.create!( f_name: 'App', l_name:'Academy', email: 'giantrobot', password: 'apples')
  User.create!( f_name: 'Arthur', l_name:'Curry', email: 'aquaman', password: 'apples')
  User.create!( f_name: 'Bruce', l_name:'Wayne', email: 'bwayne', password: 'apples')
  User.create!( f_name: 'Oliver', l_name:'Queen', email: 'oqueen', password: 'apples')
  User.create!( f_name: 'Barbara', l_name:'Gordon', email: 'bgordon', password: 'apples')
  User.create!( f_name: 'Jay', l_name:'Gatsby', email: 'gatsby', password: 'apples')
  User.create!( f_name: 'Lex', l_name:'Luthor', email: 'iamlex', password: 'apples')
  User.create!( f_name: 'Sue', l_name:'Richards', email: 'youcantseeme', password: 'apples')

  b1 = Boat.new( name: 'Popeye', lat: 37.8211, long: -122.3759, price: '100', style: 'Budget', size:  4 , user_id: 1, tagline: 'A small boat')
  b1.description = "This is a wonderfully small boat. If you like a cozy and well furnished yacht, this is the one for you!"
  b1.images.build(filepicker_url: 'https://www.filepicker.io/api/file/4qd0BKblSyet17bAINNp')
  b1.save!

  b2 = Boat.new( name: 'Trails', lat: 37.8235, long: -122.517, price: '100', style: 'Budget', size: 4, user_id: 2, tagline: 'Trailing through sf', featured: true)
  #white yacht
  b2.images.build(filepicker_url: 'https://www.filepicker.io/api/file/z6cSwAMS9KtMUwIWtkAb')
  b2.save!

  b3 = Boat.new( name: 'Bikester', lat: 37.8585, long: -122.5784, price: '600', style: 'Budget', size: 8, user_id: 3, tagline: 'biking on the ocean')
  #black boat
  b3.images.build(filepicker_url: 'https://www.filepicker.io/api/file/b7QQvsqpR8iSMpK8Z3D4')
  b3.save!

  b4 = Boat.new( name: 'Motorboat', lat: 37.8070, long: -122.3995, price: '1000', style: 'Luxury', size: 10, user_id: 3, tagline: 'the fastest thing around')
  #white yacht
  b4.images.build(filepicker_url: 'https://www.filepicker.io/api/file/IQBjaCTFqrYdt7MFo5DA')
  b4.save!
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 1, renter_id: 2, guests: 4)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 2, renter_id: 1, guests: 6)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 3, renter_id: 1, guests: 4)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 3, renter_id: 2, guests: 8)
end
