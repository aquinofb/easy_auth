require "easy_auth/engine"

module EasyAuth
  module Controllers
    autoload :Base, 'easy_auth/controllers/base'
  end

  autoload :Config, 'easy_auth/config'

  autoload :UnauthorizedError, 'easy_auth/exceptions'
  autoload :LoggedUserMethodNotDefinedError, 'easy_auth/exceptions'

  mattr_accessor :_config
  @@_config = EasyAuth::Config

  def self.config &block
    yield(self.config) if block_given?
  end

  ActiveSupport.on_load(:action_controller) do
    self.class_eval do
      include EasyAuth::Controllers::Base
    end
  end
end
