class CreateEquipmentOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :equipment_orders do |t|
      t.integer :worker_id
      t.integer :person_equipment_id
    end
  end
end
