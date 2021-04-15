require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end
  describe 'creation' do
    before do
      @user = User.create(email: 'test@test.com', password: '123456', password_confirmation: '123456', first_name: 'Visvaldas', last_name: 'Rapalis')
    end
    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without first name, last_name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).not_to be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name method that combines first and last name' do
      expect(@user.full_name).to eq('SNOW, JON')
    end
  end
end
