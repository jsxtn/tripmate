class AddAnswer5ToItinerary < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :answer5, :text
  end
end
