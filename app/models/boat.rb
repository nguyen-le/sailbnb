class Boat < ActiveRecord::Base
  belongs_to(
    :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"
  )
  has_many :images
  has_many :rental_requests
  validates :name, :lat, :long, :price, :size, :owner, :images, presence: true
end
