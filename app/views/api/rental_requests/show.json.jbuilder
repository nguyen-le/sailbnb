json.extract!(@rent_req, :id, :start, :leave, :status)
json.boat @rent_req.boat, :id, :name, :style, :tagline, :price, :size, :featured, :images
json.renter @rent_req.renter, :id, :f_name, :l_name, :nickname, :email, :image_url, :intro, :work
