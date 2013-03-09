class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :step_no
      t.text :description
      t.text :summary
      t.integer :recipe_id

      t.timestamps
    end
  end
end
