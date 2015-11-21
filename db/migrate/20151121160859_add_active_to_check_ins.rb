class AddActiveToCheckIns < ActiveRecord::Migration
  def change
    add_column :check_ins, :active, :boolean
  end
end
