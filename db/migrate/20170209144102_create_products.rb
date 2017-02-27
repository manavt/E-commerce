class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :price
      t.string :product_type

      t.timestamps
    end
  end
end
