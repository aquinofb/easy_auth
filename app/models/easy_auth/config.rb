module EasyAuth
  class Config
    attr_accessor :logged_user_method, :group_id_method

    DEFAULT_OPTS = {
      logged_user_method: :current_user,
      group_id_method:    :authorization_group_id
    }

    def initialize opts={}
      self.update_attrs(opts.presence || DEFAULT_OPTS)
    end

    def get attr_name
      self.send(attr_name)
    end

    def update_attrs opts={}
      opts.each do |k, v|
        self.send(:"#{k}=", v)
      end
    end
  end
end
