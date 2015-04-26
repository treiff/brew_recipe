class AddBeerxmlToBeers < ActiveRecord::Migration
  def change
    add_attachment :beers, :beer_xml
  end
end
