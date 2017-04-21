class AddCountEquipmentOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment_orders, :count, :integer
  end
end
