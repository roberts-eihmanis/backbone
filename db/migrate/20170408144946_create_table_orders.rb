class CreateTableOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :created_at
      t.text :file
    end
  end
end
