class Viaje < ApplicationRecord
    
    #has_one :lugar
    has_and_belongs_to_many :users
    #has_one :combi
    #has_one :chofer
    #has_one :camino
    #has_many :insumos

    #accept_nested_atributtes_for :lugars


end
