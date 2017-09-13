require 'rails_helper'

RSpec.describe SushiRoll, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe '#is_too_expensive?' do
    before(:each) do
      @sushi_roll = FactoryGirl.create(:sushi_roll)
    end
    it 'returns true if price > 20' do
      @sushi_roll.update(price: 15)
      expect(@sushi_roll.is_too_expensive?).to eq(false)
    end

    it 'returns false if price <= 20' do
      @sushi_roll.update(price: 25)
      expect(@sushi_roll.is_too_expensive?).to eq(true)
    end
  end
end
