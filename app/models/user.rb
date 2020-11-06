class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nombre, presence:true
  validates :apellido, presence:true
  validates :dni, presence:true, uniqueness:true, length: {minimum: 8, maximum: 8}, numericality: true
  validates :tarjeta, presence:true, length: {minimum: 16, maximum: 16}


end
