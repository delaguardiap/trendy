class AddPriceToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :price, :integer
  end
end
