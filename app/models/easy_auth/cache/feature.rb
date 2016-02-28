module EasyAuth
  module Cache
    class Feature
      def self.key_cache authorizable_id
        "easy_auth_allowed_features_#{authorizable_id}"
      end

      def self.by_group authorizable_id, group_id
        self.by_authorizable(authorizable_id)
            .select { |f| f[:group_id].eql?(group_id) }
      end

      def self.by_authorizable authorizable_id
        Rails.cache.read(self.key_cache(authorizable_id))
      end

      def self.update_list authorizable_id, group_id
        self.append_new_features(authorizable_id, group_id) unless self.exists?(authorizable_id, group_id)
      end

      def self.exists? authorizable_id, group_id
        Rails.cache.exist?(self.key_cache(authorizable_id))
          && self.by_group(authorizable_id, group_id).any?
      end

      def self.append_new_features authorizable_id, group_id
        hash = self.features_for(authorizable_id, group_id)
        self.append(self.key_cache(authorizable_id), hash)
      end

      def self.append key, hash
        entries = Rails.cache.read(key) || []
        Rails.cache.write(key, entries.concat(hash))
      end

      def self.features_for authorizable_id, group_id
        EasyAuth::Feature.by_authorizable(authorizable_id)
                         .by_group(group_id)
                         .map { |f| {group_id: group_id, namespace: f.namespace, action: f.action} }
      end
    end
  end
end
