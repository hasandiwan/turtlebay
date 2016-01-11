class RenameItemsBuyer < ActiveRecord::Migration
  change_table :items do |t|
    t.rename :buyer_id, :top_bid
  end
end
