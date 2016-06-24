# Responsible for handling additional functionality shared across
# subclasses.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
