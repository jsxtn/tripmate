class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.datetime :datetime
      t.string :title
      t.text :description
      t.string :category
      t.string :country
      t.string :city
      t.float :longitude
      t.float :latitude
      t.references :itinerary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
