class AddColumnsToBeer < ActiveRecord::Migration
  def change
    add_column :beers, :type, :string
    add_column :beers, :est_eff, :string
    add_column :beers, :style_category, :string
    add_column :beers, :srm, :string
    add_column :beers, :ibu, :string
  end
end
