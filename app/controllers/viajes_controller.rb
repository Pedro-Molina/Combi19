class ViajesController < ApplicationController
	def index
    @viajeSolo = Viaje.first
		@viaje = Viaje.all

  		#@viaje = Vaije.search(params[:camino])
    	#respond_to do |format|
      	#format.html # index.html.erb

    end

		def update
      byebug
	    @persona=Viaje.find(params[:viaje])

	    if @persona.update(users:)
	      redirect_to root_path
	    else
	      render :edit
	    end
	  end
end
