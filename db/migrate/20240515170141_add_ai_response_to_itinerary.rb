class AddAiResponseToItinerary < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :ai_response, :text
  end
end
