class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.references :user, index: true
      t.references :business, index: true

      t.timestamps
    end
    add_foreign_key :reviews, :users
    add_foreign_key :reviews, :businesses

  end
end
