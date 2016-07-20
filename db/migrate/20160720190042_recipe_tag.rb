class RecipeTag < ActiveRecord::Migration
  def change
    create_table(:recipes_tags) do |t|
      t.column(:tag_id, :integer)
      t.column(:recipe_id, :integer)
    end
  end
end
