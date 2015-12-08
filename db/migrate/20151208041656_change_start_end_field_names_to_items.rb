class ChangeStartEndFieldNamesToItems < ActiveRecord::Migration
  def change
    remove_index :items, :start
    remove_index :items, :end
    change_table :items do |t|
      t.rename :start, :start_time
      t.rename :end, :end_time
    end
    add_index :items, :start_time
    add_index :items, :end_time
  end
end
