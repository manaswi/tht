class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :follower_id
      t.integer :followed_id
      t.string :followed_obj

      t.timestamps
    end

    add_index :relations, :follower_id
    add_index :relations, :followed_id
    add_index :relations, [:follower_id, :followed_id, :followed_obj], unique: true
  end
end
