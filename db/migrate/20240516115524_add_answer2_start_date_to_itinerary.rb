class AddAnswer2StartDateToItinerary < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :answer2startdate, :datetime
  end
end
