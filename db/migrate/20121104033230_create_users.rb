class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :father_name
      t.string :mother_name
      t.text :address
      t.date :date_of_birth
      t.date :date_of_join

      t.timestamps
    end
  end
end
