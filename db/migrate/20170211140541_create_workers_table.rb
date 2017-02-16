class CreateWorkersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :position
      t.integer :breast_size
      t.integer :waist_size
      t.integer :hip_size
      t.integer :height
      t.integer :foot_size
    end
  end
end
