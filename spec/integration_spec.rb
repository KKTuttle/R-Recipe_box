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
