class CreateDishes < ActiveRecord::Migration[7.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :decription
      t.integer :price
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
