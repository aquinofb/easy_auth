class EasyAuthFeaturesRoles < ActiveRecord::Migration
  def change
    create_table :easy_auth_features_roles do |t|
      t.references :role, index: true
      t.references :feature, index: true

      t.timestamps null: false
    end
  end
end
