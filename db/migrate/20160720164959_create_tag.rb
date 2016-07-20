class CreateTag < ActiveRecord::Migration
  def change
    create_table(:tags) do |t|
      t.column(:name, :string)
    end
  end
end
