module EasyAuth
  class Access

    def self.can? authorizable_id, controller_path, group_id
      Cache::Feature.for_authorization(authorizable_id, group_id).detect { |feature|
        feature[:group_id].eql?(group_id) && controller_path.index("#{feature[:namespace]}/").eql?(0)
      }.present?
    end
  end
end
