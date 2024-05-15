class AddAnswer1ToItinerary < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :answer1, :string
  end
end
