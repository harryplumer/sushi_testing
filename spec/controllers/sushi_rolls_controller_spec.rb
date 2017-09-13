require 'rails_helper'

RSpec.describe SushiRollsController, type: :controller do
  login_user
  let(:valid_attributes) {
    {name: "Obamas Choice", price: 12, spicy: true}
  }
  let(:invalid_attributes) {
    {name: "", price: 12, spicy: true}
  }

  describe "GET #index" do
    it "returns http success" do
      FactoryGirl.create(:sushi_roll, user: @user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      sushi_roll = FactoryGirl.create(:sushi_roll, user: @user)      
      get :edit, params: {id: sushi_roll.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'creates a new sushi rolls' do
      post :create, params: { sushi_roll:  valid_attributes }
      expect(@user.sushi_rolls.count).to eq(1)
    end

    it 'does not create a new sushi roll with invalid params' do
      post :create, params: { sushi_roll: invalid_attributes }
      expect(@user.sushi_rolls.count).to eq(0)
    end
  end

  describe 'PUT / PATCH #update' do
    let(:new_attributes) {
      { name: 'Rainbow' }
    }

    before(:each) do
      @sushi_roll = FactoryGirl.create(:sushi_roll, user: @user)
    end

    it 'updates the bank account with valid attributes' do
      put :update, params: { id: @sushi_roll.id, sushi_roll: new_attributes }
      @sushi_roll.reload
      expect(@sushi_roll.name).to eq(new_attributes[:name])
    end

    it 'does not update the sushi roll with invalid attributes' do
      put :update, params: { id: @sushi_roll.id, sushi_roll: invalid_attributes }
      @sushi_roll.reload
      expect(@sushi_roll.name).to_not eq(invalid_attributes[:name])
    end
  end

  describe 'DELETE #destroy' do
    before(:each) do
      @sushi_roll = FactoryGirl.create(:sushi_roll, user: @user)
    end

    it "destroys the requested sushi roll" do
      expect {
        delete :destroy, params: {id: @sushi_roll.id}
    }.to change(SushiRoll, :count).by(-1)
    end
    it "it redirects to sushi roll index" do
      delete :destroy, params: {id: @sushi_roll.id}
      expect(response).to redirect_to(sushi_rolls_url)
    end 
    
  end

end
