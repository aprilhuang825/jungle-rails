class RemoveUnusedTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :favorites if table_exists?(:favorites)
    drop_table :items if table_exists?(:items)
    drop_table :messages if table_exists?(:messages)
    drop_table :users if table_exists?(:users)    
  end
end
