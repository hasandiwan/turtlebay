class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :description
      t.decimal :starting_bid, scale: 2, precision: 15
      t.datetime :starting_date, null: false
      t.datetime :end_date, null: false
      t.integer :seller, null: false
      t.integer :buyer_id

      t.timestamps null: false
    end
  end
end
