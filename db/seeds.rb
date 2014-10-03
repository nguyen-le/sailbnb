ActiveRecord::Base.transaction do
  User.create!( f_name: 'Guest', l_name:'Guester', email: 'guest', password: 'apples')
  User.create!( f_name: 'John', l_name:'Doe', email: 'johndoe', password: 'apples')
  User.create!( f_name: 'Jane', l_name:'Doe', email: 'janedoe', password: 'apples')
  User.create!( f_name: 'Elon', l_name:'Musk', email: 'elonmusk', password: 'apples')
  #5
  User.create!( f_name: 'Walter', l_name:'White', email: 'heisenberg', password: 'apples')
  User.create!( f_name: 'Tony', l_name:'Stark', email: 'irohman', password: 'apples')
  User.create!( f_name: 'Jesse', l_name:'Pinkman', email: 'jessepinky', password: 'apples')
  User.create!( f_name: 'David', l_name:'Hansson', email: 'dhh', password: 'apples')
  User.create!( f_name: 'App', l_name:'Academy', email: 'giantrobot', password: 'apples')
  #10
  User.create!( f_name: 'Arthur', l_name:'Curry', email: 'aquaman', password: 'apples')
  User.create!( f_name: 'Bruce', l_name:'Wayne', email: 'bwayne', password: 'apples')
  User.create!( f_name: 'Oliver', l_name:'Queen', email: 'oqueen', password: 'apples')
  User.create!( f_name: 'Barbara', l_name:'Gordon', email: 'bgordon', password: 'apples')
  User.create!( f_name: 'Jay', l_name:'Gatsby', email: 'gatsby', password: 'apples')
  #15
  User.create!( f_name: 'Lex', l_name:'Luthor', email: 'iamlex', password: 'apples')
  User.create!( f_name: 'Sue', l_name:'Richards', email: 'youcantseeme', password: 'apples')

  b1 = Boat.new( name: 'Popeye', lat: 37.8211, long: -122.3759, price: '100', style: 'Budget', size:  4 , user_id: 2, tagline: 'A slow and steady cruiser')
  b1.description = "This is a wonderfully small boat. If you like a cozy and well furnished yacht, this is the one for you!"
  b1.images.build(filepicker_url: 'https://www.filepicker.io/api/file/4qd0BKblSyet17bAINNp')
  b1.save!

  b2 = Boat.new( name: 'Trailblazer', lat: 37.8235, long: -122.517, price: '100', style: 'Budget', size: 4, user_id: 3, tagline: 'Fast, speedy, quick, dynamic', featured: true)
  b2.images.build(filepicker_url: 'https://www.filepicker.io/api/file/z6cSwAMS9KtMUwIWtkAb')
  b2.save!

  b3 = Boat.new( name: 'Tesla Model Y', lat: 37.8585, long: -122.5784, price: '1600', style: 'Budget', size: 8, user_id: 3, tagline: 'Clean, efficient, luxurious')
  b3.images.build(filepicker_url: 'https://www.filepicker.io/api/file/b7QQvsqpR8iSMpK8Z3D4')
  b3.save!

  b4 = Boat.new( name: 'LuthorYacht', lat: 37.8070, long: -122.3995, price: '5000', style: 'Luxury', size: 10, user_id: 15, tagline: 'The Crusher')
  b4.images.build(filepicker_url: 'https://www.filepicker.io/api/file/IQBjaCTFqrYdt7MFo5DA')
  b4.save!

  b5 = Boat.new( name: "Gatsby's", lat: 37.8070, long: -122.3995, price: '4000', style: 'Luxury', size: 10, user_id: 14, tagline: "Always a party at Gatsby's")
  b5.images.build(filepicker_url: 'https://www.filepicker.io/api/file/IQBjaCTFqrYdt7MFo5DA')
  b5.save!

  b6 = Boat.new( name: "BatmoYacht", lat: 37.8070, long: -122.3995, price: '1000', style: 'Luxury', size: 4, user_id: 11, tagline: "I am the dark shark")
  b6.images.build(filepicker_url: 'https://www.filepicker.io/api/file/IQBjaCTFqrYdt7MFo5DA')
  b6.save!

  b7 = Boat.new( name: "Ruby on Sails", lat: 37.8070, long: -122.3995, price: '18000', style: 'Luxury', size: 40, user_id: 9, tagline: "Learn you a ruby, for great good!")
  b7.images.build(filepicker_url: 'https://www.filepicker.io/api/file/IQBjaCTFqrYdt7MFo5DA')
  b7.save!

  b8 = Boat.new( name: "Queen's Gambit", lat: 37.8070, long: -122.3995, price: '2600', style: 'Sail', size: 8, user_id: 12, tagline: "A true beauty")
  b8.images.build(filepicker_url: 'https://www.filepicker.io/api/file/IQBjaCTFqrYdt7MFo5DA')
  b8.save!

  b9 = Boat.new( name: "Heisenberg", lat: 37.8070, long: -122.3995, price: '10000', style: 'Budget', size: 4, user_id: 5, tagline: "Lot's of blue sky")
  b9.images.build(filepicker_url: 'https://www.filepicker.io/api/file/IQBjaCTFqrYdt7MFo5DA')
  b9.save!

  b10 = Boat.new( name: "Iron Boat Mark V", lat: 37.8070, long: -122.3995, price: '2500', style: 'Budget', size: 4, user_id: 6, tagline: "Simply the best")
  b10.images.build(filepicker_url: 'https://www.filepicker.io/api/file/IQBjaCTFqrYdt7MFo5DA')
  b10.save!

  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 1, renter_id: 2, guests: 4)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 2, renter_id: 1, guests: 6)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 3, renter_id: 1, guests: 4)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 3, renter_id: 2, guests: 8)
end
