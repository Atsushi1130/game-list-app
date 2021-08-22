class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :postId
      t.integer :userId
      t.text :content

      t.timestamps
    end
  end
end
