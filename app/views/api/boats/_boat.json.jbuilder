json.extract!(boat, :id, :name, :lat, :long, :style, :description, :tagline, :price, :size, :featured)
json.owner boat.owner, :id, :f_name, :l_name, :nickname, :email,
  :location, :slogan, :intro, :work, :image_url
json.images boat.images, :boat_id, :filepicker_url
json.rental_requests boat.rental_requests, :id, :start, :leave, :renter_id, :boat_id
