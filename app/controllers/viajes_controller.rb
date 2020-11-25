class ViajesController < ApplicationController
	
	before_action :authenticate_user!
	def index
    @viajeSolo = Viaje.first
		@viaje = Viaje.all

    end

	def update
	    @viaje=Viaje.find(params[:viaje])
	    if (@viaje.users.where(id:current_user.id).count == 0) #El usuario ya esta en el viaje
	    	if (@viaje.users.count < Combi.find(@viaje.combi_id).capacidad) #espacio disponible
	    		if(@current_user.FechaExpiracion > Date.today)
	    			@viaje.users << User.find(current_user.id)
	    			flash[:notice] = "La compra se realizo con exito"
	    		else
	    			# redirect_to para cuando este el editar usuario
	    			flash[:alert] = "Su tarjeta ha expirado"
	    		end
	    	else
	    		flash[:alert] = "Ya no quedan espacios disponibles"
	    	end
	    else
	    	flash[:alert] = "Ya compraste este viaje"
	    end
	    redirect_to viajes_path
	end
end
