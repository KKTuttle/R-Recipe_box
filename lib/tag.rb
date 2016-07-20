class Tag < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:name, {:presence => true, :length => {:maximum => 15}})
end
