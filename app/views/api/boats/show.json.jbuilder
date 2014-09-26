json.extract!(@boat, :name, :location, :style, :description, :price, :size)
json.owner @boat.owner, :id, :f_name, :l_name, :nickname, :email,
  :location, :slogan, :intro, :work
json.images @boat.images, :id, :filepicker_url
