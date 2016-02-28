class CreateEasyAuthFeatures < ActiveRecord::Migration
  def change
    create_table :easy_auth_features do |t|
      t.string :namespace
      t.string :action

      t.timestamps null: false
    end
  end
end
