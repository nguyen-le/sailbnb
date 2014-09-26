json.array!(@boats) do |boat|
  json.partial!("api/boats/boat", boat: boat)
end
