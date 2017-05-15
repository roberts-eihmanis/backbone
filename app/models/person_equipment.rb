class PersonEquipment < ApplicationRecord
  # RelationShips
  belongs_to :worker, required: false
  belongs_to :user, foreign_key: 'issuer_id', required: false
  has_many :equipment_orders

  # Validations
  validates_presence_of :title, :price, :count, :category, :purchased_at
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
