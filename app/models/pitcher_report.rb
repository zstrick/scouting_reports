class PitcherReport < ApplicationRecord
  include Reportable

  ROLES = %w[Starter Bulk Reliever].freeze

  has_many :pitches, dependent: :destroy, inverse_of: :pitcher_report
  accepts_nested_attributes_for :pitches, reject_if: :all_blank, allow_destroy: true

  validates :role, presence: true, inclusion: { in: ROLES }
  validates_associated :pitches
end
