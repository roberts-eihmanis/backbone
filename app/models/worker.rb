class Worker < ApplicationRecord
  validates_presence_of :first_name, :last_name, :gender, :position, :start_at, :unit

  has_many :person_equipments
  has_many :equipment_orders
end
