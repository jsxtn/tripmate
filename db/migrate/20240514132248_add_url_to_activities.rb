class AddUrlToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :url, :text
  end
end
