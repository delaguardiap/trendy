class AddDefaultValueToCheckIn < ActiveRecord::Migration
  def change
  	change_column :check_ins,:active, :boolean, default: true
  end
end
