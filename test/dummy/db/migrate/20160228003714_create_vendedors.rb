class CreateVendedors < ActiveRecord::Migration
  def change
    create_table :vendedors do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
