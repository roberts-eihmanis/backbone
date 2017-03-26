class AddArticleNumberToPersonEquipments < ActiveRecord::Migration[5.0]
  def change
    add_column :person_equipments, :article_number, :string
  end
end
