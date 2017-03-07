class AddPersonEquipment < ActiveRecord::Migration[5.0]
  def change
    create_table :person_equipments do |t|
      t.string :title
      t.string :size
      t.string :manafacturer
      t.string :manafacturer_country
      t.integer :price
      t.string :code
      t.integer :count
    end
  end
end
