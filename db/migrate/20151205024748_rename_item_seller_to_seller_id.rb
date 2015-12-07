class RenameItemSellerToSellerId < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.rename :seller, :seller_id
    end
  end
end
