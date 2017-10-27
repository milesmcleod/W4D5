class Track < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :album_id }
  validates :ord, presence: true, uniqueness: { scope: :album_id }
  validates :album_id, presence: true

  belongs_to :album

  has_one :band,
    through: :album,
    source: :band

end
