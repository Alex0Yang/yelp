class CreateBusinessesTable < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
