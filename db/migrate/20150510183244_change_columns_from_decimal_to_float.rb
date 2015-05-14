class ChangeColumnsFromDecimalToFloat < ActiveRecord::Migration
  def change
    change_column :beers, :og, :float
    change_column :beers, :fg, :float
    change_column :beers, :abv, :float
  end
end
