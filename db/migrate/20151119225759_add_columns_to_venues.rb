class AddColumnsToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :lat, :float
    add_column :venues, :lng, :float
    add_column :venues, :open_now, :boolean
  end
end
