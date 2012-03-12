class CreateContainerNavigations < ActiveRecord::Migration
  def change
    create_table :container_navigations do |t|
      t.references :container
      t.references :navigation

      t.timestamps
    end
    add_index :container_navigations, :container_id
    add_index :container_navigations, :navigation_id
  end
end
