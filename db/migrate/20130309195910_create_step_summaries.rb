class CreateStepSummaries < ActiveRecord::Migration
  def change
    create_table :step_summaries do |t|
      t.text :summary
      t.integer :user_id
      t.integer :step_id

      t.timestamps
    end
    add_index :step_summaries, :user_id
    add_index :step_summaries, :step_id
  end
end
