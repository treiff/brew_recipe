# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Beer.create([
  {name: 'Row 2 Hill 56', style: 'APA', og: 1.056, fg: 1.010},
  {name: 'Boston Lager', style: 'Vienna Lager', og: 1.048, fg: 1.009},
  {name: 'Sam Smith Oatmeal Stout', style: 'Stout', og: 1.058, fg: 1.012},
  {name: 'Harpoon IPA', style: 'American IPA', og: 1.060, fg: 1.012},
  {name: 'Heady Topper', style: 'IIPA', og: 1.080, fg: 1.012},
  {name: 'Big Eye IPA', style: 'American IPA', og: 1.065, fg: 1.014},
  {name: 'Pale Ale', style: 'APA', og: 1.056, fg: 1.010},
  {name: 'Unearthed', style: 'American Stout', og: 1.066, fg: 1.010},
  {name: '2xIPA', style: 'IPA', og: 1.081, fg: 1.010}
])
