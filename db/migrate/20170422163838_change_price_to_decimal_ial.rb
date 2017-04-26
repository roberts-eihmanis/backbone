class ChangePriceToDecimalIal < ActiveRecord::Migration[5.0]
  def change
    remove_column :person_equipments, :price
    add_column :person_equipments, :price, :decimal, :default => 0
  end
end
