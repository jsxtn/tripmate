class TurnDatetimeIntoDateOnItineraries < ActiveRecord::Migration[7.1]
  def change
    change_column :itineraries, :start_date, :date
    change_column :itineraries, :end_date, :date
  end
end
