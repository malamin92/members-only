class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :story
      t.string :user_id

      t.timestamps null: false
    end
    add_index :posts, :user_id
  end
end
