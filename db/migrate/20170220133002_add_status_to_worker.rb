class AddStatusToWorker < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :active, :boolean, :default => true
  end
end
