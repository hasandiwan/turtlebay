class ChangeStartEndFieldNamesToItems < ActiveRecord::Migration
  def change
    remove_index :start
    remove_index :end
    change_table :items do |t|
      remove_index :start
      remove_index
      t.rename :start, :start_time
      t.rename :end, :end_time
    end
    add_index :items, :start_time
    add_index :items, :end_time
  end
end
