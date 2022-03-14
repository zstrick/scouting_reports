class PositionReport < ApplicationRecord
  include Reportable

  POSITIONS = %w[C 1B 2B SS 3B LF CF RF DH].freeze
  BATTING_GRADE_SCALE = [20, 30, 40, 50, 60, 70, 80].freeze

  validates :position, presence: true, inclusion: { in: POSITIONS }
  validates :running_time, numericality: { greater_than_or_equal_to: 0 }
  validates :batting_grade, numericality: { only_integer: true },
                            inclusion: { in: BATTING_GRADE_SCALE }
end
