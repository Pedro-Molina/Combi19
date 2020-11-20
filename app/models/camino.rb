class ValidarLugar < ActiveModel::Validator
	def validate(aux)
		if aux[:origen_id].eql? aux[:destino_id]
			aux.errors.add :base, "El origen y el destino no pueden ser los mismos"
		end
	end
end

class Camino < ApplicationRecord
	validates :camino, presence:true
	#has_many :viajes
	
	belongs_to :origen, class_name: 'Lugar'
	belongs_to :destino, class_name: 'Lugar'
	
	validates_with ValidarLugar,field: [:origen, :destino]
	
	def custom_label_method
		"#{self.camino}"
	end
end
