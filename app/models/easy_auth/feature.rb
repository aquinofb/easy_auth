module EasyAuth
  class Feature < ActiveRecord::Base
    has_and_belongs_to_many :roles

    scope :by_authorizable, -> (authorizable_id) {
      joins(:roles).merge(Role.by_authorizable(authorizable_id))
    }

    scope :by_group, -> (group_id) {
      joins(:roles).merge(Role.by_group(group_id))
    }
  end
end
