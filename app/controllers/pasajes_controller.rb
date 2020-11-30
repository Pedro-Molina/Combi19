class PasajesController < ApplicationController
	def update
		@pasaje=Pasaje.find(params[:id])
		if (@pasaje.estado)
			@pasaje.estado = false
			@pasaje.save
			if (Date.today + 2.days > Viaje.find(@pasaje.viaje_id).FechayHora)
				flash[:notice] = "Se cancelo el viaje pero solo se reintegra el 50%"
			end
		end
		redirect_to listaViajes_path	
	end
end
