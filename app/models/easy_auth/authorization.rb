module EasyAuth
  class Authorization < ActiveRecord::Base
    belongs_to :role
    belongs_to :authorizable, polymorphic: true

    validates :role_id, :authorizable_id, presence: true
    validates :role_id, uniqueness: {scope: [:authorizable_id, :group_id]}

    after_destroy :delete_cache

    scope :by_authorizable, -> (authorizable_id) {
      where(authorizable_id: authorizable_id)
    }

    scope :by_group, -> (group_id) {
      where(group_id: group_id)
    }

    def delete_cache
      Rails.cache.delete(Cache::Feature.key_cache(self.authorizable_id))
    end
  end
end
