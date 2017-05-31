class Worker < ApplicationRecord
  validates_presence_of :first_name, :last_name, :gender, :position, :start_at, :unit

  has_many :person_equipments, dependent: :destroy
  has_many :equipment_orders, dependent: :destroy

  def self.search(search)
    if search
      where("CONCAT_WS(' ', first_name, last_name) LIKE :q", :q => "%#{search}%")
    else
      all
    end
  end
end
