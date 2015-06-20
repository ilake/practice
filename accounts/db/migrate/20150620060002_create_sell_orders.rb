class CreateSellOrders < ActiveRecord::Migration
  def change
    create_table :sell_orders do |t|
      t.integer :amount
      t.integer :rate

      t.timestamps null: false
    end
  end
end
