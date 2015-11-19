class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.float :rating

      t.timestamps null: false
    end
  end
end
