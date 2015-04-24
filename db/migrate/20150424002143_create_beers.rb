class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.text :description
      t.integer :og
      t.integer :fg
      t.integer :abv

      t.timestamps
    end
  end
end
