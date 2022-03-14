class Pitch < ApplicationRecord

  PITCH_TYPES = ["Fastball", "Sinker", "Slider", "Curve Ball", "Change up"].freeze

  belongs_to :pitcher_report

  validates :velocity_high, presence: true,
                            numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than: 120 }
  validates :velocity_low, presence: true,
                           numericality: { only_integer: true,
                                           greater_than_or_equal_to: 0,
                                           less_than: 120 }
  validates :pitch_type, presence: true, inclusion: { in: PITCH_TYPES }
end
