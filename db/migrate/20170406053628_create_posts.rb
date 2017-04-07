class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts, id: false do |t|
      t.integer :user_id
      t.integer :id, primary_key: true
      t.string :title
      t.string :content
      t.string :tags
      t.string :status
      t.timestamps
    end
  end
end
