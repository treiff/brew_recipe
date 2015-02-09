module Requests
  module OmniAuthMocks
    def login_with_oauth
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
        :info => {
          :name => 'Test User',
          :email => 'testguy@example.com',
          :provider => 'facebook',
          :uid => '123456'
        },
        :credentials => {
          :token => '234dsklfj342kjgklj32lkj',
          :expires_at => 1428684845
        }
      })
    end
  end
end
