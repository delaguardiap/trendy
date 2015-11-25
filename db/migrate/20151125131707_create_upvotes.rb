class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.references :check_in, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
