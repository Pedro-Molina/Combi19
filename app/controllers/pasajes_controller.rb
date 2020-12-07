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

	def updateReview
		accion=params[:accion]
		comentario=params[:pasaje][:comentario]
		puntaje=params[:rating]

		if (puntaje.nil?)
			flash[:alert] = "Debe ingresar un puntaje"
			redirect_to edit_review_path(Pasaje.find(params[:id]))
			return 
		end

		if Pasaje.find(params[:id]).update(comentario: comentario, puntaje: puntaje)
			if accion == "eliminar"
			  flash[:alert] = "Reseña Eliminada"
		  else
				flash[:notice] = "Reseña Cambiada"
			end
		else
			flash[:alert] = "Ocurrió un error al guardar la reseña"
		end
		redirect_to listaViajes_path
	end
end
