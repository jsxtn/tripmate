class RemoveAddressFromItineraries < ActiveRecord::Migration[7.1]
  def change
    remove_column :itineraries, :address, :string
  end
end
