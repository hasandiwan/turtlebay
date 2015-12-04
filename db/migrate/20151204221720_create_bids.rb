class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.decimal :amount, null: false, scale: 2, precision: 15
      t.integer :bidder_id, null: false
      t.integer :item_id, null: false

      t.timestamps null: false
    end
  end
end
