class AddPathCacheToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :path_cache, :string

  end
end
