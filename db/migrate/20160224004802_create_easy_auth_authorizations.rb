class CreateEasyAuthAuthorizations < ActiveRecord::Migration
  def change
    create_table :easy_auth_authorizations do |t|
      t.references :role, foreign_key: true
      t.references :group, foreign_key: true
      t.references :authorizable, polymorphic: true

      t.timestamps null: false
    end

    add_index :easy_auth_authorizations, :role_id, name: "index_easy_auth_role_id"
    add_index :easy_auth_authorizations, :group_id, name: "index_easy_auth_group_id"
    add_index :easy_auth_authorizations, :authorizable_id, name: "index_easy_auth_authorizable_id"
  end
end
