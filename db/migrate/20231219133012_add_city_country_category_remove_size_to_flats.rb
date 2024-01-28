class AddCityCountryCategoryRemoveSizeToFlats < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :city, :string
    add_column :flats, :country, :string
    add_column :flats, :category, :string

    remove_column :flats, :size, :integer
  end
end
