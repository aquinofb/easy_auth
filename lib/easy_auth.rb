require "easy_auth/engine"

module EasyAuth
  module Controllers
    autoload :Base, 'easy_auth/controllers/base'
  end

  autoload :UnauthorizedError, 'easy_auth/exceptions'
  autoload :LoggedUserMethodNotDefinedError, 'easy_auth/exceptions'

  ActiveSupport.on_load(:action_controller) do
    self.class_eval do
      include EasyAuth::Controllers::Base
    end
  end
end
