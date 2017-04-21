class PersonEquipment < ApplicationRecord
  belongs_to :worker, required: false
  belongs_to :user, foreign_key: 'issuer_id', required: false
  has_many :equipment_orders
end
