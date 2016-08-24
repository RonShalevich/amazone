require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) {FactoryGirl.create :user}
  describe '#new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    context 'with valid parameters' do
      def valid_request
        post :create, params: {user: {first_name:'Ron',
                                      last_name: 'Shelves',
                                      email: 'ron@shleves.com',
                                      password: '123',
                                      password_confirmation: '123'}}
      end
      it 'saves the user in hte database' do
        count_before = User.count
        valid_request
        count_after = User.count
        expect(count_after).to eq(count_before+1)
      end
      it 'redirect to homepage' do
        valid_request
        expect(response).to redirect_to(root_path)
      end
      it 'signs the user in' do
        valid_request
        expect(session[:user_id]).to eq(User.last.id)
      end
    end
    context 'with invalid parameters' do
      def invalid_request
        post :create, params: {user: {first_name:'Ron',
                                      last_name: 'Shelves',
                                      email: 'ron@shleves.com',
                                      password: '123',
                                      password_confirmation: '12356'}}
      end

      it 'renders new template' do
        invalid_request
        expect(response).to render_template(:new)
      end
      it 'doesnt create new user in database' do
        count_before = User.count
        invalid_request
        count_after = User.count
        expect(count_after).to eq(count_before)
      end
    end
  end
end
