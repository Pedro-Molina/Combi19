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

end
