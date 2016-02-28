module EasyAuth
  module Controllers
    module Base
      extend ActiveSupport::Concern

      included do
        #TODO: remove this logic.
        before_filter only: [:destroy] do |controller|
          if controller.is_a?(Devise::SessionsController) && current_user.present?
            Rails.cache.delete Cache::Feature.key_cache(current_user.id)
          end
        end
      end

      protected
        def authorization_group_id; nil; end
        def current_user; nil; end

        def authorize_user!
          raise EasyAuth::LoggedUserMethodNotDefinedError unless current_user.present?
          
          if !can?(current_user.id, self.authorization_group_id, self.controller_path, self.action_name)
            raise EasyAuth::UnauthorizedError
          end
        end

        def can? user_id, group_id, controller_path, action_name
          Access.can?(user_id, group_id, controller_path, action_name)
        end
    end
  end
end
