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
    @viaje = Viaje.find(params[:id])
     userId = Pasaje.where(viaje_id:@viaje.id,estado:true).pluck(:user_id) #usuarios del viaje que no lo cancelaron
     @pasajeros = User.where(id:userId)
  end

  def preguntasCovid
    @pasaje = Pasaje.find(params[:id])
  end

  def actualizarDatos

    condicion = params[:perdida].to_i+params[:garganta].to_i+params[:respiratoria].to_i+params[:temperatura].to_i+params[:fiebre].to_i
    pasaje = Pasaje.find(params[:id])
    if (params[:temperatura] == "1") or  (condicion > 1)
      usuario = User.find(pasaje.user_id)
      usuario.update(covid: Date.today)      #acualizo la fecha del usuario para que no pueda comprar

      fechaLimite = Date.today + 15.days
      viajes = usuario.viajes.where(FechayHora: Date.today..fechaLimite)
      pasajes = Pasaje.where(user_id:usuario,viaje_id:viajes).where.not(id: pasaje)
      pasajes.update_all(estado:false)      #cancelo los demas viajes pendientes que tenia el usuario dentro de 15 dias

      pasaje.update(covid: true)            #aparece como rechazado en el viaje
      flash[:alert] = "Pasajero rechazado"

    else
      pasaje.update(covid: false)           #aparece como aceptado en el viaje
      flash[:notice] = "Pasajero aceptado"
    end
    redirect_to listaPasajeros_path(Viaje.find(pasaje.viaje_id))
  end

end
