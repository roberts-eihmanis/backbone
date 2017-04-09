class Order < ApplicationRecord
  has_and_belongs_to_many :workers
  has_and_belongs_to_many :person_equipments
end