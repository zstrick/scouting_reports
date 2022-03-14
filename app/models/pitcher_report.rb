class PitcherReport < ApplicationRecord
  include Reportable

  ROLES = %w[Starter Bulk Reliever].freeze

  has_many :pitches, dependent: :destroy

  validates :role, presence: true, inclusion: { in: ROLES }
end
