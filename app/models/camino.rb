class Camino < ApplicationRecord
	validates :camino, presence:true
	has_many :viajes
end
