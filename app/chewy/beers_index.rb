# Indexes named fields for search
class BeersIndex < Chewy::Index
  define_type Beer do
    field :name, :style, :type, :ibu
  end
end
