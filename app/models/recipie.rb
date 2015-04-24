# Generates recipie objects
class Recipie < ActiveRecord::Base
  belongs_to :user
end
