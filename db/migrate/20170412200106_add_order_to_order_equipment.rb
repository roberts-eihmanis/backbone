class AddOrderToOrderEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :equipment_orders, :order_id, :integer
  end
end
