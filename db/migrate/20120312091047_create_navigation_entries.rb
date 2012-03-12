class CreateNavigationEntries < ActiveRecord::Migration
  def change
    create_table :navigation_entries do |t|
      t.references :navigation
      t.references :entry
      t.integer :position

      t.timestamps
    end
    add_index :navigation_entries, :navigation_id
    add_index :navigation_entries, :entry_id
  end
end
