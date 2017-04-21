class AddSpecialOrderIal < ActiveRecord::Migration[5.0]
  def change
    add_column :person_equipments, :special_order, :boolean, :default => false
  end
end
