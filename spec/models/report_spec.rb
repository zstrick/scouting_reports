require 'rails_helper'

RSpec.describe Report, type: :model do
  describe 'associations' do
    it { should belong_to(:player) }
    it { should belong_to(:scout) }
  end

  describe 'validations' do
    it { should validate_presence_of(:player) }
    it { should validate_presence_of(:scout) }
  end
end
