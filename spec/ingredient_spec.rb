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

  it "shows all of the recipes with a certain ingredient" do
    ingredient = Ingredient.new({:name => 'onion'})
    ingredient.save
    expect(Ingredient.find_by({:name => "onion"})).to(eq(ingredient))
  end
end
