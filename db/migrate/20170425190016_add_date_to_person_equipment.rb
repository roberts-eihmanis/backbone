class AddDateToPersonEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :person_equipments, :purchased_at, :datetime
  end
end
