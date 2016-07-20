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
  
end
