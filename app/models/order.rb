class Order < ApplicationRecord
  has_many :equipment_orders
end