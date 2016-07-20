require('spec_helper')

describe(Recipe) do
  it "validates presence of name and ingredient" do
    recipe = Recipe.new({:name => '', :instructions => "", :rating => 0})
    expect(recipe.save).to(eq(false))

  end
  it "allows user to type maximum of 30 for name" do
    recipe = Recipe.new({:name => "a".*(31), :instructions => "do this", :rating => 0})
    expect(recipe.save).to(eq(false))

  end
  it "allows user to type maximum of 100 for instructions" do
    recipe = Recipe.new({:name => "Crepes", :instructions => "a".*(101), :rating => 0})
    expect(recipe.save).to(eq(false))
  end

end
