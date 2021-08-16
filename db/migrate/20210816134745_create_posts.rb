class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.float :review
      t.text :article
      t.integer :userId

      t.timestamps
    end
  end
end
