class EquipmentOrder < ApplicationRecord
  belongs_to :person_equipment
  belongs_to :worker
  belongs_to :order, required: false
end