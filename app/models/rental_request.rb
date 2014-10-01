class RentalRequest < ActiveRecord::Base
  belongs_to :boat
  belongs_to(
    :renter,
    primary_key: :id,
    foreign_key: :renter_id,
    class_name: "User"
  )
  validates :start, :leave, :status, :boat_id, :renter_id, :guests, presence: true
  before_validation :is_overlapping_with_approved?
  after_initialize :initial_status_pending

  def is_overlapping_with_approved?
    array_overlapping =
    RentalRequest.where(<<-SQL, { approved: "Approved", start: self.start, leave: self.leave  })
      status = :approved
    AND
      start <= :start
    AND
      leave >= :leave
    SQL
    array_overlapping.length == 0
  end

  def initial_status_pending
    self.status ||=  "Pending"
  end
end
