json.extract!(@boat, :name, :location, :type, :description, :price, :size)
json.owner @boat.owner, :id, :f_name, :l_name, :nickname, :email, 
  :location, :slogan, :intro, :work
