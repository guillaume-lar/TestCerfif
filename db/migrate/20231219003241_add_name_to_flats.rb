class AddNameToFlats < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :name, :string
  end
end
