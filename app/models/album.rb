class Album < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :band_id, :year, presence: true

  belongs_to :band
  has_many :tracks
end
