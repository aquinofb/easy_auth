module EasyAuth
  module Cache
    class Feature
      def self.key_cache authorizable_id
        "#{Rails.application.class.parent_name}_heimdall_allowed_features_#{authorizable_id}"
      end

      def self.for_authorization authorizable_id, group_id
        key = self.key_cache(authorizable_id)
        self.append(key, self.hash_from_database(authorizable_id, group_id)) unless self.exists_for_group?(key, group_id)
        Rails.cache.read(key)
      end

      def self.append key, hash
        entries = Rails.cache.read(key) || []
        Rails.cache.write(key, entries.concat(hash))
      end

      def self.exists_for_group? key, group_id
        Rails.cache.exist?(key) && Rails.cache.read(key).detect {|e| e[:group_id].eql?(group_id)}.present?
      end

      def self.hash_from_database authorizable_id, group_id
        features = Heimdall::Feature.by_group(group_id).by_authorizable(authorizable_id)
        features.map {|feature| {group_id: group_id, namespace: feature.namespace} }
      end
    end
  end
end
