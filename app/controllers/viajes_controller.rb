class ViajesController < ApplicationController
	def index

		@viaje = Viaje.all

  		#@viaje = Vaije.search(params[:camino])
    	#respond_to do |format|
      	#format.html # index.html.erb

    end
end
