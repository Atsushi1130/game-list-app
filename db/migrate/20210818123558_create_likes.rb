class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :postId
      t.integer :userId

      t.timestamps
    end
  end
end
