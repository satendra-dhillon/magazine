class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :text
      t.belongs_to :commenter
      t.belongs_to :blog
      t.integer  :parent_comment_id

      t.timestamps null: false
    end
  end
end
