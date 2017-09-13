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

  describe '.only_spicy' do
    it 'returns only spicy sushi rolls' do
      FactoryGirl.create(:sushi_roll, spicy: true)
      FactoryGirl.create(:sushi_roll, spicy: false)
      rolls = SushiRoll.all.only_spicy
      expect(rolls.first.spicy).to eq(true)
      expect(rolls.count).to eq(1)
    end
  end

  describe '.only_mild' do
    it 'returns only mild sushi rolls' do
      FactoryGirl.create(:sushi_roll, spicy: true)
      FactoryGirl.create(:sushi_roll, spicy: false)
      rolls = SushiRoll.all.only_mild
      expect(rolls.first.spicy).to eq(false)
      expect(rolls.count).to eq(1)
    end
  end

  describe '.by_price' do
    it 'sorts rolls by price ASC' do
      FactoryGirl.create(:sushi_roll, price: 25)
      FactoryGirl.create(:sushi_roll, price: 20)
      FactoryGirl.create(:sushi_roll, price: 15)
      rolls = SushiRoll.all.by_price
      expect(rolls.first.price).to eq(15)
      expect(rolls[1].price).to eq(20)
      expect(rolls[2].price).to eq(25)
    end
  end

end
