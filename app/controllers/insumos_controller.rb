class InsumosController < ApplicationController

	def index
	end

	def listaInsumos
		@pasaje = Pasaje.find(params[:id])
		@insumos = Insumo.all
	end

	def compraInsumos
		pasaje = Pasaje.find(params[:id])
		insumo = Insumo.find(params[:format])
		if(current_user.FechaExpiracion > Date.today)#tarjeta cancelada
			carrito =Carrito.where(pasaje_id:pasaje,insumo_id:insumo).first
			if carrito.nil?
				pasaje.insumos << insumo
			else
				carrito.update(cantidad:(carrito.cantidad+1))
			end
		else
			flash[:alert] = "Su tarjeta ha expirado"
		end	
		redirect_to listaInsumos_path(pasaje)
	end

	def devolucionInsumo
		pasaje = Pasaje.find(params[:id])
		insumo = Insumo.find(params[:format])
		carrito =Carrito.where(pasaje_id:pasaje,insumo_id:insumo).first
		if (carrito.cantidad < 2)
			carrito.destroy
		else
			carrito.update(cantidad:(carrito.cantidad-1))
		end
		redirect_to listaInsumos_path(pasaje)
	end
end
