class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :strike
      t.string :mail
      t.integer :id

      t.timestamps
    end
  end
end
