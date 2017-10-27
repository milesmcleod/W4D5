class Band < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :albums

  has_many :tracks,
    through: :albums,
    source: :tracks

end
