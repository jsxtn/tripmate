class AddAnswer3ToItinerary < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :answer3, :string
  end
end
