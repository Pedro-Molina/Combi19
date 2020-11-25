#class ValidarLugar < ActiveModel::Validator
#	def validate(aux)
#		if aux[:origen].eql? aux[:destino]
#			aux.errors.add :base, "El origne y el destino no pueden ser los mismos"
#		end
#	end
#end


class Lugar < ApplicationRecord
	validates :ciudad, presence: true#, uniqueness:true
	validates :provincia, presence: true
	#validates_with ValidarLugar,field: [:origen, :destino]
	validates :ciudad, uniqueness: { scope:  :provincia }
	#validates_uniqueness_of :car_model_name, :scope => [:brand_id, :fuel_type_id]

	def custom_label_method
		"#{self.ciudad}"
	end

	def formatoViajeOrigen
        "#{Lugar.find(Camino.find(viaje.camino_id).origen_id).ciudad} #{Lugar.find(Camino.find(viaje.camino_id).origen_id).provincia}"
    end

    def formatoViajeDestino
        "#{Lugar.find(Camino.find(viaje.camino_id).destino_id).ciudad} #{Lugar.find(Camino.find(viaje.camino_id).destino_id).provincia}"
    end
end
