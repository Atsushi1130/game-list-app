class AddAipIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts,:aipId,:text
  end
end
