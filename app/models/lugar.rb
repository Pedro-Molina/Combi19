#class ValidarLugar < ActiveModel::Validator
#	def validate(aux)
#		if aux[:origen].eql? aux[:destino]
#			aux.errors.add :base, "El origne y el destino no pueden ser los mismos"
#		end
#	end
#end


class Lugar < ApplicationRecord
	validates :ciudad, presence: true, uniqueness:true
	#validates_with ValidarLugar,field: [:origen, :destino]

	def custom_label_method
		"#{self.ciudad}"
	end
end
