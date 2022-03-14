require 'rails_helper'

RSpec.describe Pitch, type: :model do
  describe 'associations' do
    it { should belong_to(:pitcher_report) }
  end

  describe 'validations' do
    it { should validate_presence_of(:velocity_high) }
    it { should validate_presence_of(:velocity_low) }
    it { should validate_presence_of(:pitch_type) }
    it { should validate_numericality_of(:velocity_high).is_greater_than_or_equal_to(0).is_less_than(120).only_integer }
    it { should validate_numericality_of(:velocity_low).is_greater_than_or_equal_to(0).is_less_than(120).only_integer }
    it do
      should validate_inclusion_of(:pitch_type).
        in_array(["Fastball", "Sinker", "Slider", "Curve Ball", "Change up"])
    end
  end
end
