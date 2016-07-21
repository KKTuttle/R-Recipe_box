require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('updating ingredients', {:type => :feature}) do
  it 'allows users to updated existing ingredients' do
    recipe = Recipe.new({:name => 'Pie', :instructions => 'do this', :rating => 0})
    recipe.save()
    recipe.ingredients.create({:name => "milk"})
    recipe.ingredients.create({:name => 'flour'})
    visit('/')
    click_link('Pie')
    click_link('Edit')
    select('milk', :from => 'ingredient_name')
    fill_in('ingredient_update', :with => 'Almond milk')
    click_button('Update Ingredients')
    expect(page).to have_content('Almond milk')
  end
end




describe('adding ingredients',{:type => :feature}) do
  it 'allows users to add ingredients to a recipe' do
    recipe = Recipe.new({:name => 'French Crepes', :instructions => 'do this', :rating => 0})
    recipe.save()
    recipe.ingredients.create({:name => "milk"})
    recipe.ingredients.create({:name => 'flour'})
    recipe.ingredients.create({:name => 'eggs'})
    recipe.ingredients.create({:name => 'oil'})
    recipe.ingredients.create({:name => 'water'})
    visit('/')
    click_link('French Crepes')
    click_link('Edit')
    fill_in('ingredient_add1', :with => 'jam')
    fill_in('ingredient_add2', :with => 'butter')
    click_button('Add Ingredients')
    expect(page).to have_content('jam')
  end
end
