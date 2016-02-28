module EasyAuth
  class Access

    def self.can? authorizable_id, group_id, controller_path, action_name=nil
      feature = self.find_feature_by_group(authorizable_id, group_id)

      return false if feature.nil?

      verify_namespace(controller_path, feature[:namespace]) &&
        verify_action(action_name, feature[:action])
    end

    private
      def self.find_feature_by_group authorizable_id, group_id
        Cache::Feature.for_authorization(authorizable_id, group_id)
                      .detect { |feature| feature[:group_id].eql?(group_id) }
      end

      def self.verify_namespace controller_path, feature_namespace
        controller_path.index("#{feature_namespace}/").eql?(0)
      end

      def self.verify_action requested_action, feature_action
        return true unless feature_action.present?

        requested_action.eql?(feature_action)
      end
  end
end
