class RentalRequest < ActiveRecord::Base
  belongs_to :boat
  belongs_to(
    :renter,
    primary_key: :id,
    foreign_key: :renter_id,
    class_name: "User"
  )
  validates :start, :leave, :status, :boat_id, :renter_id, presence: true
  after_initialize :initial_status_pending

  def initial_status_pending
    this.status ||=  "Pending"
  end
end
