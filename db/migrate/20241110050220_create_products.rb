class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price_cents
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.integer :stock_quantity

      t.timestamps
    end
  end
end
