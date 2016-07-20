class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  has_and_belongs_to_many(:tags)
  validates(:name, {:presence => true, :length => {:maximum => 30}})
  validates(:instructions, {:presence => true, :length => {:maximum => 100}})
end
