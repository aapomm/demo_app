class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :full_name
      t.integer :age
      t.string :sex
      t.string :location

      t.string :source_number

      t.boolean :found, :default => false

      t.timestamps null: false
    end
  end
end
