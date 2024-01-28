class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.string :address
      t.text :description
      t.float :price
      t.integer :size
      t.integer :room
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
