class IngredientRecipe < ActiveRecord::Migration
  def change
    create_table(:ingredients_recipes) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)
    end
  end
end
