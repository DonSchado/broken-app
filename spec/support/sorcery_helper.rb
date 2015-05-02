module Sorcery
  module TestHelpers
    module Rails
      module Integration
        # Accepts arguments for user to login, route to use and HTTP method
        def login_user(user = nil, route = session_url)
          user ||= @user
          page.driver.send(:post, route, session: { email: user.email, password: '123456' })
        end

        # Accepts route and HTTP method arguments
        def logout_user(route = session_url, http_method = :delete)
          page.driver.send(http_method, route)
        end
      end
    end
  end
end
