class AddColumnsToCheckIn < ActiveRecord::Migration
  def change
    add_column :check_ins, :rating, :integer
    add_column :check_ins, :review, :string
  end
end
