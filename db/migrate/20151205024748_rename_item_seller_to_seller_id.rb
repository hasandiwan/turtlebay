class RenameItemSellerToSellerId < ActiveRecord::Migration
  def change
    t.rename :seller, :seller_id
  end
end
