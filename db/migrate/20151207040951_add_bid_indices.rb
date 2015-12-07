class AddBidIndices < ActiveRecord::Migration
  def change
    add_index :bids, :bidder_id
    add_index :bids, :item_id
    add_index :bids, :amount
  end
end
