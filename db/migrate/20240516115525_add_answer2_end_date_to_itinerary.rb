class AddAnswer2EndDateToItinerary < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :answer2enddate, :datetime
  end
end
