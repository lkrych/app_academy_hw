require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe '#new' do
    context 'if user is not logged in' do
      it 'should render the new view' do
        get :new
        expect(response).to be_success
        expect(response).to render_template('new')
      end
    end
  end

  describe '#create' do
    context 'params contain valid user' do
      it 'should redirect to user\'s show page' do
        post :create, params: { user: { email: "darlingtuna@savetheseas.org", password: "password" } }
        expect(response).to redirect_to(user_url(User.find_by(email: controller.params[:user][:email])))
      end
    end

    context 'params are missing user information' do
      it 'should render new page' do
        post :create, params: { user: { email: "darlingtuna@savetheseas.org", password: "bogus" } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end

  end

  describe '#show' do
    it 'should render show view' do
      user = User.create(email: 'darlingtuna@savetheseas.org', password: 'password')
      get :show, params: { id: user.id }
      expect(response).to be_success
      expect(response).to render_template(:show)
    end
  end
end
