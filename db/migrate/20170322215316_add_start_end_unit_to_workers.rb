class AddStartEndUnitToWorkers < ActiveRecord::Migration[5.0]
  def change
    add_column :workers, :start_at, :datetime
    add_column :workers, :end_at, :datetime
    add_column :workers, :unit, :string
  end
end
