require('spec_helper')

describe(Ingredient) do
  it "allows user type maximum of 30" do
    ingredient = Ingredient.new({:name => "a".*(31)})
    expect(ingredient.save).to(eq(false))
  end
  it "validates presence of the ingredient name" do
    ingredient = Ingredient.new({:name => ''})
    expect(ingredient.save).to(eq(false))
  end

  describe('.find_name') do
    it "finds an ingredient by name and returns an id" do
      ingredient = Ingredient.new({:name => 'onion'})
      expect(Ingredient.find_name("onion")).to(eq(ingredient))
    end
  end
end
