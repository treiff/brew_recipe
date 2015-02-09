require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  context 'when password is invalid' do
    it 'renders the page with error' do
      user = create(:user)
      post :create, session: { email: user.email, password: 'invalid' }

      expect(response).to render_template(:new)
      expect(flash.now[:error]).to match(/^Username\/Password invalid/)
    end
  end

  context 'when password is valid' do
    it 'creates a session and redirects home' do
      user = create(:user)
      post :create, session: { email: user.email, password: user.password }

      expect(response).to redirect_to '/'
      expect(flash[:notice]).to match(/^Signed in successfully/)
      expect(current_user).to eql user
    end
  end

  context 'when logging out' do
    it 'destroys the session' do
      user = { user_id: 5 }
      delete :destroy, session[user]

      expect(session.destroy).to redirect_to '/'
      expect(session[:user_id]).to eql nil
      expect(flash[:notice]).to match(/^Signed out successfully/)
    end
  end
end
