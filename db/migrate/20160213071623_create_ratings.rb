class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.decimal :score
      t.belongs_to :rater
      t.belongs_to :blog
      t.timestamps null: false
    end
  end
end
