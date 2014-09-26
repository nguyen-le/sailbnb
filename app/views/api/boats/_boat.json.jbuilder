json.extract!(boat, :id, :name, :location, :style, :description, :price, :size)
json.owner boat.owner, :id, :f_name, :l_name, :nickname, :email,
  :location, :slogan, :intro, :work, :image_url
json.images boat.images, :boat_id, :filepicker_url
