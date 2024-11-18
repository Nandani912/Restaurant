class CreateMenus < ActiveRecord::Migration[7.2]
  def change
    create_table :menus do |t|
      t.string :title
      t.references :restaur, null: false, foreign_key: true

      t.timestamps
    end
  end
end
