class AddItemIndices < ActiveRecord::Migration
  def change
    add_index :items, :seller_id
    add_index :items, :buyer_id
    add_index :items, :start
    add_index :items, :end
  end
end
