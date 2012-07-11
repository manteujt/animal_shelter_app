class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :description
      t.integer :age
      t.boolean :dog

      t.timestamps
    end
  end
end
