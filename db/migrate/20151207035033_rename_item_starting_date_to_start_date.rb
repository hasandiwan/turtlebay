class RenameItemStartingDateToStartDate < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.rename :starting_date, :start
      t.rename :end_date, :end
    end
  end
end
