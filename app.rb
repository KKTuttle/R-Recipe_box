require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

# SEARCHING BY INGREDIENT
get('/search') do
  name = params.fetch('ingredient_search')
  ingredient = Ingredient.find_by({:name => name})
  @recipe_results = ingredient.recipes()
  @recipes = Recipe.all()
  erb(:index)
end

# ADDING A RECIPE
get('/recipes/new') do
  @recipes = Recipe.all()
  erb(:recipe_form)
end
# ADD TAGS => CHOOSE FROM DROPDOWN TAGS
patch('/recipe/:id/tag/select') do
  recipe_id = params.fetch('recipe_id')
  @recipe = Recipe.find(recipe_id)
  tag = Tag.find(params.fetch("tag_select"))
  @recipe.tags.push(tag)
  redirect to("/recipe/#{@recipe.id}/edit")
end

# ADD A NEW TAG => CUSTOM
patch('/recipe/:id/tag') do
  @recipe = Recipe.find(params.fetch('recipe_id'))
  tag_name = params.fetch('tag_new')
  @recipe.tags.create({:name => tag_name})
  redirect to("/recipe/#{@recipe.id}/edit")
end

# ADD A RATING
patch('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('recipe_id'))
  rating = (params.fetch('rating_select')).to_i
  @recipe.update({:rating => rating})
  redirect to ("/recipe/#{@recipe.id}")
end

post('/recipes/new') do
  name = params.fetch('name')
  ingredient_1 = params.fetch('ingredient_1')
  ingredient_2 = params.fetch('ingredient_2')
  ingredient_3 = params.fetch('ingredient_3')
  ingredient_4 = params.fetch('ingredient_4')
  ingredient_5 = params.fetch('ingredient_5')
  instructions = params.fetch('instructions')
  recipe = Recipe.create({:name => name, :rating => 0, :instructions => instructions})
  @ingred1 = Ingredient.find_or_create_by({:name => ingredient_1})
  @ingred2 = Ingredient.find_or_create_by({:name => ingredient_2})
  @ingred3 = Ingredient.find_or_create_by({:name => ingredient_3})
  @ingred4 = Ingredient.find_or_create_by({:name => ingredient_4})
  @ingred5 = Ingredient.find_or_create_by({:name => ingredient_5})
  recipe.ingredients.push(@ingred1)
  recipe.ingredients.push(@ingred2)
  recipe.ingredients.push(@ingred3)
  recipe.ingredients.push(@ingred4)
  recipe.ingredients.push(@ingred5)
  @recipes = Recipe.all()
  erb(:index)
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  @stars = @recipe.rating
  erb(:recipe)
end

get('/recipe/:id/edit') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  @tags = Tag.all
  erb(:recipe_edit)
end

patch('/recipe/:id/name') do
  name = params.fetch('recipe_new_name')
  @recipe = Recipe.find(params.fetch('id').to_i)
  @recipe.update({:name => name})
  redirect to("/recipe/#{@recipe.id}/edit")
end

patch('/recipe/:id/instructions') do
  instructions = params.fetch('instruction_new_name')
  @recipe = Recipe.find(params.fetch('id').to_i)
  @recipe.update({:instructions => instructions})
  redirect to("/recipe/#{@recipe.id}/edit")
end

delete('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i)
  @recipe.destroy()
  redirect to("/")
end

patch('/recipe/:id/ingredients') do
  ingredient_id = params.fetch('ingredient_name').to_i
  recipe_id = params.fetch('recipe_id').to_i
  ingredient = Ingredient.find(ingredient_id)
  @recipe = Recipe.find(recipe_id)
  name = params.fetch('ingredient_update')
  ingredient.update({:name => name})
  redirect to("/recipe/#{@recipe.id}/edit")
end

post('/recipe/:id/edit') do
  ingredient1 = params.fetch("ingredient_add1")
  ingredient2 = params.fetch("ingredient_add2")
  recipe_id = params.fetch('recipe_id').to_i
  @recipe = Recipe.find(recipe_id)
  @recipe.ingredients.create({:name => ingredient1})
  @recipe.ingredients.create({:name => ingredient2})
  redirect to("/recipe/#{@recipe.id}/edit")
end


delete('/recipe/:id/tag/delete') do
  recipe_id = params.fetch('recipe_id')
  @recipe = Recipe.find(recipe_id)
  tag_id = params.fetch('tag_delete')
  tag = Tag.find(tag_id)
  tag.destroy()
  redirect to("/recipe/#{@recipe.id}/edit")
end



get("/clear") do
  Recipe.all().each() do |recipe|
    recipe.destroy()
  end
  Ingredient.all().each() do |ingredient|
    ingredient.destroy()
  end
  redirect("/")
end
