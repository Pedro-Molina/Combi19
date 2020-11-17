class ValidarTarjeta < ActiveModel::Validator
  def validate(aux)
    if aux[:FechaExpiracion] < Date.today
      aux.errors.add :base, "La tarjeta expiro"
    end
  end
end


class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nombre, presence:true
  validates :apellido, presence:true
  validates :dni, presence:true, uniqueness:true, length: {minimum: 8, maximum: 8}, numericality: true
  validates :tarjeta, presence:true, length: {minimum: 16, maximum: 16}
  
  validates_with ValidarTarjeta,field: [:FechaExpiracion]

  has_and_belongs_to_many :viaje

  def custom_label_method
		"#{self.nombre}"
	end

#
end
