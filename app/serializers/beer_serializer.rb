# Serializer for Beer model
class BeerSerializer < ActiveModel::Serializer
  attributes :id, :name, :style, :og, :fg
end
