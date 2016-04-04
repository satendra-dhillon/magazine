class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :description
      t.string :author
      t.decimal :rating

      t.timestamps null: false
    end
  end
end
