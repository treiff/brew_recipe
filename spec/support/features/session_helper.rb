module Features
  # Generates users for session specs
  module SessionHelpers
    def valid_sign_up_credentials
      user = build(:valid_user)

      fill_in "Name", with: user.name
      fill_in "Email", with: user.email
      fill_in "Username", with: user.username
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with:  user.password_confirmation
    end
  end

  # Generates mock Omniauth user
  module OmniAuthMocks
    def login_with_oauth
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
        info: {
          name: 'Test User',
          email: 'testguy@example.com',
          provider: 'facebook',
          uid: '123456'
        },
        credentials: {
          token: '234dsklfj342kjgklj32lkj',
          expires_at: 1428684845
        }
      )
    end
  end
end
