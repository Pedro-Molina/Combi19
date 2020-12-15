class ViajesController < ApplicationController

	before_action :authenticate_user!
	def index
		viajeValido = Viaje.all.where(estado: "pendiente")
		@viajeSolo = viajeValido.first
		if (@viajeSolo.nil?)
			flash[:alert] = "No existen viajes para comprar"
			redirect_to user_path
		end
    	@viaje = viajeValido.all
  end

	def update
		@viaje=Viaje.find(params[:viaje])
		pasaje = Pasaje.where(viaje_id:@viaje.id, user_id:current_user.id)
		espacio_disponible = Pasaje.where(viaje_id:@viaje.id, estado:true).count


	    	if ( espacio_disponible < Combi.find(@viaje.combi_id).capacidad) #espacio disponible
				if(current_user.FechaExpiracion > Date.today)#tarjeta cancelada
					if((current_user.covid.nil?) or (current_user.covid + 15.days) < @viaje.FechayHora.to_date) #covid
	    				if (pasaje.first.nil?) #no compro alguna vez este viaje
	    					@viaje.users << User.find(current_user.id)
							flash[:notice] = "La compra se realizo con exito"
						else
							if (pasaje.first.estado)  #si el viaje esta pendiente o cancelado
	    						flash[:alert] = "Ya compraste este viaje"
	    					else
	    						pasaje.first.estado = true
	    						pasaje.first.save
	    						flash[:notice] = "La compra se realizo con exito"
	    					end
	    				end
					else
						flash[:alert] = "No puede comprar por covid"
					end
	    		else
	    			flash[:alert] = "Su tarjeta ha expirado"
	    		end
	    	else
	    		flash[:alert] = "Ya no quedan espacios disponibles"
	    	end
	    redirect_to viajes_path
	end

	def expressUpdate
		@viaje=Viaje.find(params[:viaje])
		pasaje = Pasaje.where(viaje_id:@viaje.id, user_id:current_user.id)
		espacio_disponible = Pasaje.where(viaje_id:@viaje.id, estado:true).count


	    	if ( espacio_disponible < Combi.find(@viaje.combi_id).capacidad) #espacio disponible
					if((current_user.covid.nil?) or (current_user.covid + 15.days) < @viaje.FechayHora.to_date) #covid
	    				if (pasaje.first.nil?) #no compro alguna vez este viaje
	    					@viaje.users << User.find(current_user.id)
							flash[:notice] = "La compra se realizo con exito"
						else
							if (pasaje.first.estado)  #si el viaje esta pendiente o cancelado
	    						flash[:alert] = "Ya compraste este viaje"
	    					else
	    						pasaje.first.estado = true
	    						pasaje.first.save
	    						flash[:notice] = "La compra se realizo con exito"
	    					end
	    				end
					else
						flash[:alert] = "No puede comprar por covid"
					end
	    	else
	    		flash[:alert] = "Ya no quedan espacios disponibles"
	    	end
	    redirect_to compraExpressViaje_path
	end

	def compraExpressViaje
		viajeValido = Viaje.all.where(estado: "activo")
		@viajeSolo = viajeValido.first
		if (@viajeSolo.nil?)
			flash[:alert] = "No existen viajes para comprar"
			redirect_to user_path
		end
    	@viaje = viajeValido.all
  end

	def review
    @pasaje=Pasaje.find(params[:id])
		if not(@pasaje.estado)
			redirect_to listaViajes_path
		end
	end

	def listaViajes
		@viaje = current_user.viajes.order(:FechayHora)
	end
end
