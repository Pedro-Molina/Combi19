class Pasaje < ApplicationRecord
  belongs_to :viaje
  belongs_to :user

  
end