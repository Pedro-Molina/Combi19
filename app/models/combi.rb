class Combi < ApplicationRecord
  validates :patente, presence:true
  validates :capacidad, presence:true, numericality: true
  validates :modelo, presence:true
  has_many :viajes
end
