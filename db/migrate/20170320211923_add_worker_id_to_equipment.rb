class AddWorkerIdToEquipment < ActiveRecord::Migration[5.0]
  def change
    add_column :person_equipments, :worker_id, :integer
  end
end
