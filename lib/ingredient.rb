class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:name, {:length => {minimum: 1}, uniqueness: true})

end
