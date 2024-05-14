class AddAddressToItineraries < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :address, :string
  end
end
