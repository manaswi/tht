class CreateStepIngredients < ActiveRecord::Migration
  def change
    create_table :step_ingredients do |t|
      t.decimal :quantity, :precision => 6, :scale => 2
      t.string :unit
      t.string :ingredient
      t.integer :step_id

      t.timestamps
    end

    add_index :step_ingredients, :ingredient

  end
end