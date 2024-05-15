class AddAnswer4ToItinerary < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :answer4, :text
  end
end
