require 'rails_helper'

RSpec.describe PositionReport, type: :model do
  describe 'associations' do
    it { should have_one(:report) }
  end

  describe 'validations' do
    it { should validate_presence_of(:position) }

    it do
      should validate_inclusion_of(:position).
        in_array(%w[C 1B 2B SS 3B LF CF RF DH])
    end

    it { should validate_numericality_of(:running_time).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:batting_grade).only_integer }
    it do
      should validate_inclusion_of(:batting_grade).
        in_array([20, 30, 40, 50, 60, 70, 80])
    end
  end
end
