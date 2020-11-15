class Camino < ApplicationRecord
	validates :camino, presence:true
	has_many :viajes
	
	belongs_to :origen, class_name: 'Lugar'
	belongs_to :destino, class_name: 'Lugar'
	
	
	def custom_label_method
		"#{self.camino}"
	end
end
