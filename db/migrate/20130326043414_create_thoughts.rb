class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end

    add_index :thoughts, :user_id

  end
end