require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'associations' do
    it { should have_many(:reports) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
