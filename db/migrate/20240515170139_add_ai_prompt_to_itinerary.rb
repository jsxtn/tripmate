class AddAiPromptToItinerary < ActiveRecord::Migration[7.1]
  def change
    add_column :itineraries, :ai_prompt, :text
  end
end
