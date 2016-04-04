class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.decimal :score
      t.belongs_to :commenter
      t.belongs_to :blog
      t.belongs_to :reply
      t.timestamps null: false
    end
  end
end
