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

  def self.report_search(date_lte, date_gte)
    scope = all
    if date_gte
      scope.where("purchased_at >= ?", date_gte.to_date).
        where("purchased_at <= ?", date_lte.to_date)
    else
      all
    end
  end
end
