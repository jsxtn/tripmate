class AddAnswer6ToItinerary < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :answer6, :text
  end
end
