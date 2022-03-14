require 'rails_helper'

RSpec.describe PitcherReport, type: :model do
  describe 'associations' do
    it { should have_one(:report) }
    it { should have_many(:pitches) }
  end

  describe 'validations' do
    it { should validate_presence_of(:role) }
    it do
      should validate_inclusion_of(:role).
        in_array(%w[Starter Bulk Reliever])
    end
  end
end
