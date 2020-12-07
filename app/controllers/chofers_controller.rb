class ChofersController < ApplicationController
  before_action :authenticate_chofer! , except: [:new,:create]
  before_action :authenticate_admin!, only: [:new,:create]

  def index
    
  end

  def new
    @chofer = Chofer.new
  end

  def create
    #byebug
    @chofer = Chofer.new(params.require(:chofer).permit(:nombre, :password, :email, :apellido, :dni, :telefono))
    if @chofer.save
      redirect_to admin_path
    else
      render :new
    end
    return
  end

  def choferViajes
		@viaje = Viaje.where(chofer_id: current_chofer.id)
  end
  
  def editarEstado
    @viaje = Viaje.find(params[:id])

    if (@viaje.pendiente?)
      @viaje.update(estado:"activo")
    else
      if (@viaje.activo?)
        @viaje.update(estado:"finalizado")
      end
    end
    redirect_to choferViajes_path 
  end

  def choferPasajeros
    @pasajeros = Viaje.find(params[:id]).users
  end
end
