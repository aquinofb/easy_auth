module EasyAuth
  module Config
    cattr_accessor :logged_user_method
    @@logged_user_method = :current_user

    cattr_accessor :group_id_method
    @@group_id_method = :authorization_group_id
  end
end
