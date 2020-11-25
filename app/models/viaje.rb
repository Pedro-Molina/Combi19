class Viaje < ApplicationRecord
    
    #has_and_belongs_to_many :users
    belongs_to :combi
    belongs_to :chofer
    belongs_to :camino

    validates :chofer_id, uniqueness: { scope: [:camino_id, :FechayHora, :combi_id] }#, message: "must be given please" 

    def custom_label_method
		"Viaje #{self.id}"
    end
    
    #accepts_nested_attributes_for :camino

    def formatoViaje
        #"#{Lugar.formatoViajeOrigen(self)} - #{Lugar.formatoViajeDestino(self)} - #{Viaje.FechayHora}" # Origen Destino Fecha
        "#{Lugar.find(Camino.find(self.camino_id).origen_id).ciudad}/#{Lugar.find(Camino.find(self.camino_id).origen_id).provincia} - #{Lugar.find(Camino.find(self.camino_id).destino_id).ciudad}/#{Lugar.find(Camino.find(self.camino_id).destino_id).provincia} - #{self.FechayHora.to_formatted_s(:db)}" # Origen Destino Fecha
    end

end
