require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all()
  erb(:index)
end

get('/recipes/new') do
  @recipes = Recipe.all()
  erb(:recipe_form)
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
  recipe.ingredients.create({:name => ingredient_1})
  recipe.ingredients.create({:name => ingredient_2})
  recipe.ingredients.create({:name => ingredient_3})
  recipe.ingredients.create({:name => ingredient_4})
  recipe.ingredients.create({:name => ingredient_5})
  @recipes = Recipe.all()
  erb(:index)
end

get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  erb(:recipe)
end

get('/recipe/:id/edit') do
  @recipe = Recipe.find(params.fetch('id').to_i())
  erb(:recipe_edit)
end

patch('/recipe/:id/name') do
  name = params.fetch('recipe_new_name')
  @recipe = Recipe.find(params.fetch('id').to_i)
  @recipe.update({:name => name})
  redirect to("/recipe/#{@recipe.id}/edit")
end
