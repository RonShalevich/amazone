require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    it 'requires a first name' do
      user = User.new FactoryGirl.attributes_for(:user).merge({first_name: nil})
      user.valid?
      expect(user.errors).to have_key(:first_name)
    end
    it 'requires a last name' do
      user = User.new FactoryGirl.attributes_for(:user).merge({last_name: nil})
      user.valid?
      expect(user.errors).to have_key(:last_name)
    end
    it 'requires a unique email' do
      user = FactoryGirl.create(:user)
      attributes = FactoryGirl.attributes_for :user
      attributes[:email] = user.email
      user1 = User.new attributes
      user1.valid?
      expect(user1.errors).to have_key :email
    end
    it 'require full name to be titelized' do
      user = User.new first_name:'ron', last_name:'shelves'
      outcome = user.full_name
      expect(outcome).to eq("Ron Shelves")
    end
  end
end
