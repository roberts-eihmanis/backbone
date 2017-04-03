class AddIssuerDateToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :person_equipments, :issuer_date, :datetime
  end
end
