class EditColumnsInBeersTable < ActiveRecord::Migration
  def change
    change_column :beers, :og, :decimal, precision: 4, scale: 3
    change_column :beers, :fg, :decimal, precision: 4, scale: 3
    change_column :beers, :abv, :decimal, precision: 2, scale: 1
  end
end
