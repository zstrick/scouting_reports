class Player < ApplicationRecord
  has_many :reports, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
