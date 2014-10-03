ActiveRecord::Base.transaction do
  User.create!( f_name: 'Guest', l_name:'Guester', email: 'guest', password: 'apples')
  User.create!( f_name: 'Popeye', l_name:'Sailor', email: 'johndoe', password: 'apples', image_url:'https://www.filepicker.io/api/file/bcxeYBz1QxCC6vmBbamP')
  User.create!( f_name: 'Jane', l_name:'Doe', email: 'janedoe', password: 'apples')
  User.create!( f_name: 'Elon', l_name:'Musk', email: 'elonmusk', password: 'apples', image_url:'https://www.filepicker.io/api/file/eDD9cNdBRNiNT0abUus1', intro: "Elon Musk was born in South Africa and became a multimillionaire in his late twenties when he sold his start-up company, Zip2, to a division of Compaq Computers. He went on to more early success launching PayPal via a 2000 merger, Space Exploration Technologies Corp. (SpaceX) in 2002, and Tesla Motors in 2003. Musk made headlines in May 2012 when SpaceX launched a rocket that would send the first commercial vehicle to the International Space Station.")
  #5
  User.create!( f_name: 'Walter', l_name:'White', email: 'heisenberg', password: 'apples', image_url:'https://www.filepicker.io/api/file/lb6dS6duQJSl4n2IEllU', intro:"When I was a graduate student of chemistry at the California Institute of Technology, he conducted research on proton radiography that helped a team win a Nobel Prize in Chemistry. After graduate school, I founded the firm Gray Matter Technologies with Elliott Schwartz, his former classmate and close friend. Around this time, I dated his lab assistant, Gretchen. However, he abruptly left both Gretchen and Gray Matter Technologies, selling his financial interest in the company for $5,000. Gretchen and Elliott later married and made a fortune, much of it from my research. Though they remain friendly, I secretly resents both Gretchen and Elliott for profiting from his work.")
  User.create!( f_name: 'Tony', l_name:'Stark', email: 'irohman', password: 'apples', image_url:'https://www.filepicker.io/api/file/YcwCNyvtS8eyy2rSA9gW', intro: "An American billionaire playboy, industrialist, and ingenious engineer, I suffered a severe chest injury during a kidnapping in which my captors attempt to force me to build a weapon of mass destruction. I instead created a powered suit of armor to save my life and escape captivity. I later used the suit and successive versions to protect the world as Iron Man. Through my corporation, Stark Industries, I have created many military weapons, some of which, along with other technological devices of my making, have been integrated into my suit, helping me fight crime.")
  User.create!( f_name: 'Jesse', l_name:'Pinkman', email: 'jessepinky', password: 'apples')
  User.create!( f_name: 'David', l_name:'Hansson', email: 'dhh', password: 'apples')
  User.create!( f_name: 'App', l_name:'Academy', email: 'giantrobot', password: 'apples', image_url:'https://www.filepicker.io/api/file/F6tvi2w5T3WpKSejIfjF', intro: "App Academy is an immersive web development and job placement program in San Francisco and New York City. You only pay us if you find a job as a developer after the program. 98% of our graduates have offers or are working in tech jobs. In SF, graduates receive an average salary of $100,000; in NY, graduates receive an average salary of $84,000.")
  #10
  User.create!( f_name: 'Arthur', l_name:'Curry', email: 'aquaman', password: 'apples')
  User.create!( f_name: 'Bruce', l_name:'Wayne', email: 'bwayne', password: 'apples', image_url:'https://www.filepicker.io/api/file/EfnkTMjcQEurEMxP3JFv', intro: "In my everyday identity, I am Bruce Wayne, a wealthy businessman living in Gotham City. I avert suspicion by acting the part of a superficial, dim-witted playboy idly living off my family's fortune (amassed through investment in real estate before the city became a bustling metropolis) and the profits of Wayne Enterprises, my inherited conglomerate. I support philanthropic causes through my nonprofit Wayne Foundation, but am more widely known as a celebrity socialite. In public, I pretend to be a heavy drinker, using ginger ale to suggest champagne and liberally serving alcohol to guests that I never actually consumes myself. In reality, I is a strict teetotaler concerned to maintain top physical fitness and mental acuity. In public, I appears frequently in the company of fashionable women to encourage tabloid gossip. In reality, there is less than meets the eye: though I lead an active romantic life, crime-fighting accounts for most of my night hours.")
  User.create!( f_name: 'Oliver', l_name:'Queen', email: 'oqueen', password: 'apples', image_url:'https://www.filepicker.io/api/file/xh4bzsGvQzWTvez3iSTc', intro: "I am perhaps the finest archer ever known. I can shoot 29 arrows per minute. I have a wide-variety of trick arrows, ranging from bola arrows to time-bomb arrows to my infamous boxing-glove arrow. In recent years I have used these arrows sparingly, preferring the time-tested simple arrow. I have shown the ability to shoot an arrow down the barrel of a gun, pierce a drop of water as it leaves a tap, as well as shoot almost any part of the human body: although I aim only to wound and not kill when I shoots. I once shot two arrows down two different gun barrels while upside down, in mid-flip while somersaulting off a building. I am proficient in several forms of martial arts including judo, wing chun, taekwondo, as well as eskrima. Proclaimed as a martial arts master, I have shown the ability to take on seven people at once. I spent several months dedicated to making myself a better fighter and trained with many of the world's finest martial arts teachers and even went through training from Natas, the same person who trained Deathstroke.")
  User.create!( f_name: 'Barbara', l_name:'Gordon', email: 'bgordon', password: 'apples')
  User.create!( f_name: 'Jay', l_name:'Gatsby', email: 'gatsby', password: 'apples', image_url:'https://www.filepicker.io/api/file/vtLYoWuORh61NezMWm0e', intro: "I hail from rural North Dakota, where I was born to a dirt poor German American farming family in the 1890s. I despised the limits of poverty. I dropped out of St. Olaf College in Minnesota only a few weeks into my first semester because I was 'dismayed at its ferocious indifference to the drums of my destiny' and (as I later explains to Nick Carraway) I could not bear working as a janitor to support myself through college any longer. After dropping out, I went to Lake Superior, where I met Dan Cody, a copper tycoon, in Little Girl Bay. Dan Cody became my mentor and invited me to join his ten-year yacht trek. At seventeen, I changed my name to Jay Gatsby and, over the next five years, learned the ways of the wealthy. Cody left me $25,000 in his will, but after his death, Cody's mistress cheated me out of the inheritance.")
  #15
  User.create!( f_name: 'Lex', l_name:'Luthor', email: 'iamlex', password: 'apples', image_url:'https://www.filepicker.io/api/file/wuDaWNKuT6icPztaekrv', intro: "I am a fictional character, a supervillain appearing in comic books published by DC Comics. I am the archenemy of Superman, though given my status as a supervillain, I have also come into conflict with Batman and other superheroes in the DC Universe. Created by Jerry Siegel and Joe Shuster, I first appeared in Action Comics #23 (April 1940). I am a wealthy, power-mad business magnate of high intelligence and incredible technological prowess. My goals typically center on killing Superman, the foremost obstacle to achieving the villain's megalomaniacal goals. Despite periodically wearing a powered exoskeleton, I have traditionally lacked superpowers or a dual identity. I has carefully crafted his public persona however, in order to avoid arrest. I am well known for my philanthropy, donating millions of dollars to Metropolis over the years, funding parks, foundations, and medical charities.")
  User.create!( f_name: 'Sue', l_name:'Richards', email: 'youcantseeme', password: 'apples', image_url:'https://www.filepicker.io/api/file/Qn64M4exQqiUoj40uD1G')

  b1 = Boat.new( name: 'Popeye', lat: 37.8211, long: -122.3759, price: '100', style: 'Budget', size:  4 , user_id: 2, tagline: 'A slow and steady cruiser')
  b1.description = "This is a wonderfully small boat. If you like a cozy and well furnished yacht, this is the one for you!"
  b1.images.build(filepicker_url: 'https://www.filepicker.io/api/file/Lx8GFggKQwi1t74c1KSB')
  b1.images.build(filepicker_url: 'https://www.filepicker.io/api/file/yv7ohkiHRmKP9zbIAePs')
  b1.save!

  b2 = Boat.new( name: 'Trailblazer', lat: 37.8235, long: -122.517, price: '100', style: 'Budget', size: 4, user_id: 16, tagline: 'Fast, speedy, quick, dynamic')
  b2.images.build(filepicker_url: 'https://www.filepicker.io/api/file/pZfx7PqQQPCqV0vDK175')
  b2.images.build(filepicker_url: 'https://www.filepicker.io/api/file/MybpUDYRS7aFdwKIbOCH')
  b2.save!

  b3 = Boat.new( name: 'Tesla Model Y', lat: 37.8585, long: -122.5784, price: '1600', style: 'Budget', size: 8, user_id: 4, tagline: 'Clean, efficient, luxurious')
  b3.images.build(filepicker_url: 'https://www.filepicker.io/api/file/9Hb16TFGQRaWQJIAKGc8')
  b3.images.build(filepicker_url: 'https://www.filepicker.io/api/file/Njq2qmT6TZ2xxGrTuTXc')
  b3.save!

  b4 = Boat.new( name: 'LuthorYacht', lat: 37.8070, long: -122.3995, price: '5000', style: 'Luxury', size: 10, user_id: 15, tagline: 'The Crusher')
  b4.images.build(filepicker_url: 'https://www.filepicker.io/api/file/eLSTyE54R8eejfER1CYH')
  b4.images.build(filepicker_url: 'https://www.filepicker.io/api/file/Kp4ZH9gOQM6dKDB2xYmc')
  b4.save!

  b5 = Boat.new( name: "Gatsby's", lat: 37.8070, long: -122.3995, price: '4000', style: 'Luxury', size: 10, user_id: 14, tagline: "Always a party at Gatsby's", featured: true)
  b5.images.build(filepicker_url: 'https://www.filepicker.io/api/file/rfxbMyC2TbOfLzstStMh')
  b5.images.build(filepicker_url: 'https://www.filepicker.io/api/file/lNMQDdaySrii2ORsyFUT')
  b5.save!

  b6 = Boat.new( name: "BatmoYacht", lat: 37.8070, long: -122.3995, price: '1000', style: 'Luxury', size: 4, user_id: 11, tagline: "I am the dark shark", featured: true)
  b6.images.build(filepicker_url: 'https://www.filepicker.io/api/file/aElIjSZSqGl8s79sRgJw')
  b6.images.build(filepicker_url: 'https://www.filepicker.io/api/file/K4pxUCdIRkGt3wDlmO81')
  b6.save!

  b7 = Boat.new( name: "Ruby on Sails", lat: 37.8070, long: -122.3995, price: '18000', style: 'Luxury', size: 40, user_id: 9, tagline: "Learn you a ruby, for great good!", featured: true)
  b7.images.build(filepicker_url: 'https://www.filepicker.io/api/file/r1urBxbBQ1F6nJdRmsdT')
  b7.images.build(filepicker_url: 'https://www.filepicker.io/api/file/7OHKJ13DSXyIU8SWUIGU')
  b7.save!

  b8 = Boat.new( name: "Queen's Gambit", lat: 37.8070, long: -122.3995, price: '2600', style: 'Sail', size: 8, user_id: 12, tagline: "A true beauty")
  b8.images.build(filepicker_url: 'https://www.filepicker.io/api/file/hPWYZ7OKQYqMMZ4PMepB')
  b8.images.build(filepicker_url: 'https://www.filepicker.io/api/file/xOrr8wNDR5Dtl2MclWLz')
  b8.save!

  b9 = Boat.new( name: "Heisenberg", lat: 37.8070, long: -122.3995, price: '10000', style: 'Budget', size: 4, user_id: 5, tagline: "Lot's of blue sky", featured: true)
  b9.images.build(filepicker_url: 'https://www.filepicker.io/api/file/nKQJfurmRC215WrqHP0n')
  b9.images.build(filepicker_url: 'https://www.filepicker.io/api/file/6OaYwD0Tqifhda7FOR7m')
  b9.save!

  b10 = Boat.new( name: "Iron Boat Mark V", lat: 37.8070, long: -122.3995, price: '2500', style: 'Budget', size: 4, user_id: 6, tagline: "Simply the best")
  b10.images.build(filepicker_url: 'https://www.filepicker.io/api/file/zwADveISyOwfSAlY3qmb')
  b10.images.build(filepicker_url: 'https://www.filepicker.io/api/file/4gJSnTeyTLiycJvcLVDI')
  b10.save!

  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 1, renter_id: 2, guests: 4)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 2, renter_id: 1, guests: 6)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 3, renter_id: 1, guests: 4)
  RentalRequest.create(start:'30/9/2014', leave:'6/10/2014', boat_id: 3, renter_id: 2, guests: 8)
end
