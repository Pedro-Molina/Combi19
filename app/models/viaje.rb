class Viaje < ApplicationRecord
    
    #has_one :lugar
    has_and_belongs_to_many :users
    belongs_to :combi
    belongs_to :chofer
    #has_many :insumos
    belongs_to :camino #para que funcion la relacion la tengo que agregar en una migration
    
    # or if you want a dropdown select: 
      
    # attr_accessor :camino_id

    #  # Since ActiveRecord does not create setters/getters for has_one associations (why is beyond me), diy:
    #   def camino_id
    #     self.camino.try :id
    #   end
      
    #   def camino_id=(id)
    #     self.camino = Camino.find_by_id(id)
    #   end
    



end
