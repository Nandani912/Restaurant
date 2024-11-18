class CreateRestaurs < ActiveRecord::Migration[7.2]
  def change
    create_table :restaurs do |t|
      t.string :name
      t.text :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
