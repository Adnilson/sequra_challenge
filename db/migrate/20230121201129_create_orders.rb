class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.decimal :amount, precision: 6, scale: 2
      t.datetime :completed_at
      t.boolean :disbursed, default: false
      t.references :merchant, null: false, foreign_key: true
      t.references :shopper, null: false, foreign_key: true

      t.timestamps
    end
  end
end
