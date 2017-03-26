class AddCategoryToIal < ActiveRecord::Migration[5.0]
  def change
    add_column :person_equipments, :category, :string
  end
end
