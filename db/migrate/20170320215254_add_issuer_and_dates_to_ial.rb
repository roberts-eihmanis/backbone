class AddIssuerAndDatesToIal < ActiveRecord::Migration[5.0]
  def change
    add_column :person_equipments, :issuer_id, :integer
    add_column :person_equipments, :warranty, :string
  end
end
