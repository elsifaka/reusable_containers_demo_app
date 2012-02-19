class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.string :permalink
      t.string :title
      t.string :destination_action
      t.integer :destination_content_id
      t.string :destination_content_type
      t.string :container_id

      t.timestamps
    end
  end
end
