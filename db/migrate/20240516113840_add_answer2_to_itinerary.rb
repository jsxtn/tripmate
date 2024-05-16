class AddAnswer2ToItinerary < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :answer2, :string
  end
end
