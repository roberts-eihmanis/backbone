require 'carrierwave/orm/activerecord'
class Order < ApplicationRecord

  mount_uploader :file, PdfsUploader

  has_many :equipment_orders
  has_many :person_equipments, through: :equipment_orders
  has_many :workers, through: :equipment_orders
end