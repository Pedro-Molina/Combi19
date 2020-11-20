class Chofer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable #borre  :registerable, para que no se puedan registrar como choferes

  validates :nombre, presence:true
  validates :apellido, presence:true
  validates :dni, presence:true, uniqueness:true, length: {minimum: 8, maximum: 8}, numericality: true
  validates :telefono, presence:true, numericality: true
  validates :email, presence:true, uniqueness:true
  validates :password, presence:true
  validates :password_confirmation, presence:true
  
  #has_many :viajes


  def custom_label_method
    "#{self.nombre}"
  end

  rails_admin do
    exclude_fields :created_at, :updated_at, :remember_created_at, :reset_password_sent_at
  end

end
