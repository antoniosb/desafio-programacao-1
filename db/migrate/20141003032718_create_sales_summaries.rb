class CreateSalesSummaries < ActiveRecord::Migration
  def change
    create_table :sales_summaries do |t|
      t.string  :purchaser_name, null: false
      t.string  :item_description, null: false
      t.float   :item_price, null: false
      t.integer :purchase_count, null: false
      t.string  :merchant_address, null: false
      t.string  :merchant_name, null: false

      t.timestamps
    end
  end
end
