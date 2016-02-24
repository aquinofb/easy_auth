module EasyAuth
  class Role < ActiveRecord::Base
    has_many :authorizations
    has_and_belongs_to_many :features

    scope :by_authorizable, -> (authorizable_id) {
      joins(:authorizations).merge(Authorization.by_authorizable(authorizable_id))
    }

    scope :by_group, -> (group_id) {
      joins(:authorizations).merge(Authorization.by_group(group_id))
    }
  end
end
