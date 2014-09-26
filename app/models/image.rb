class Image < ActiveRecord::Base
  validates :filepicker_url, :boat, presence: true
  belongs_to :boat
end
