class UpdateMoreColumnsUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :active, :boolean
    add_column :users, :position, :string
  end
end
