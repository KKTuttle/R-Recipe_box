require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a recipe',{:type => :feature}) do
  it 'allows users to add a recipe, and see it listed on the page' do
    visit('/')
    click_link('Add Recipe')
    fill_in('name', :with => 'crepes')
    fill_in('ingredient_1', :with => 'milk')
    fill_in('ingredient_2', :with => 'flour')
    fill_in('ingredient_3', :with => 'eggs')
    fill_in('ingredient_4', :with => 'oil')
    fill_in('instructions', :with => 'do this')
    click_button('Add Recipe')
    expect(page).to have_content('crepes')
  end
end

describe('editing a recipe',{:type => :feature}) do
  it 'allows users to edit a recipe name' do
    visit('/')
    click_link('Add Recipe')
    fill_in('name', :with => 'crepes')
    fill_in('ingredient_1', :with => 'milk')
    fill_in('ingredient_2', :with => 'flour')
    fill_in('ingredient_3', :with => 'eggs')
    fill_in('ingredient_4', :with => 'oil')
    fill_in('instructions', :with => 'do this')
    click_button('Add Recipe')
    click_link("crepes")
    click_link('Edit')
    fill_in('recipe_new_name', :with => 'french crepes')
    click_button('Update Name')
    expect(page).to have_content('french crepes')
  end
end

describe('deleting recipe' ,{:type => :feature}) do
  it "allows user to delete recipe" do
    recipe = Recipe.new({:name => 'crepes', :instructions => 'do this', :rating => 0})
    recipe.save()
    recipe.ingredients.create({:name => "milk"})
    recipe.ingredients.create({:name => 'flour'})
    recipe.ingredients.create({:name => 'eggs'})
    recipe.ingredients.create({:name => 'oil'})
    recipe.ingredients.create({:name => 'water'})
    visit('/')
    click_link('crepes')
    click_link('Edit')
    click_button('Delete Recipe')
    expect(page).to have_no_content('crepes')
  end
end

describe('editing instructions',{:type => :feature}) do
  it 'allows users to edit instructions' do
    recipe = Recipe.new({:name => 'crepes', :instructions => 'do this', :rating => 0})
    recipe.save()
    recipe.ingredients.create({:name => "milk"})
    recipe.ingredients.create({:name => 'flour'})
    recipe.ingredients.create({:name => 'eggs'})
    recipe.ingredients.create({:name => 'oil'})
    recipe.ingredients.create({:name => 'water'})
    visit('/')
    click_link('crepes')
    click_link('Edit')
    fill_in('instruction_new_name', :with => 'do that')
    click_button('Update Instructions')
    expect(page).to have_no_content('do this')
  end
end

# rating
