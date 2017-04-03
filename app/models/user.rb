class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  

  validates_presence_of :first_name, :last_name
  has_many :person_equipments


  def admin?
    role == "admin"
  end
end
