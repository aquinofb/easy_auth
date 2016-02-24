class CreateEasyAuthRoles < ActiveRecord::Migration
  def change
    create_table :easy_auth_roles do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
