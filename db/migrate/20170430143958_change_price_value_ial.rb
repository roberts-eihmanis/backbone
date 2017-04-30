class ChangePriceValueIal < ActiveRecord::Migration[5.0]
  def change
    change_column :person_equipments, :price, :decimal, :precision => 6, :scale => 2
  end
end
