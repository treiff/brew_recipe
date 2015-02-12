require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "POST create" do
    context 'with invalid credentials' do
      it 'renders new action' do
        user = create(:user)
        post :create, user: { email: user.email, password: user.password, password_confirmation: 'ut-oh' }

        expect(response).to render_template(:new)
      end
    end

    context 'with valid credentials' do
      it 'creates user' do
        user = create(:user)

        expect{ post :create, user: attributes_for(:user) }.to change(User, :count).by(1)
      end

      it 'redirects to root path' do
        user = create(:user)
        post :create, user: attributes_for(:user)

        expect(flash[:notice]).to match(/^Welcome to brewblog/)
        expect(response).to redirect_to root_path
      end
    end
  end

  describe "get index" do
    it "populates an array of users" do
      user = create(:user)
      get :index

      expect(assigns(:users)).to eq([user])
    end

    it "renders the index template" do
      get :index

      expect(response).to render_template :index
    end
  end

end
