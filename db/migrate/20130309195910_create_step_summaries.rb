class CreateStepSummaries < ActiveRecord::Migration
  def change
    create_table :step_summaries do |t|
      t.text :summary
      t.integer :user_id
      t.integer :step_id

      t.timestamps
    end
  end
end
