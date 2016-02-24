module EasyAuth
  module Controllers
    module Base
      extend ActiveSupport::Concern

      included do
        before_filter only: [:destroy] do |controller|
          if controller.is_a?(Devise::SessionsController) && current_user.present?
            Rails.cache.delete Cache::Feature.key_cache(current_user.id)
          end
        end
      end

      protected
        def auth_group_id
          nil
        end

        def authorize_user!
          raise CurrentUserNotDefinedError unless current_user.present?

          if !can?(current_user, self.class, auth_group_id)
            raise Heimdall::UnauthorizedError
          end
        end

        def can? user, controller, group_id
          controller_path = controller.to_s.underscore
          Access.can?(user.id, controller_path, group_id)
        end
    end
  end
end
