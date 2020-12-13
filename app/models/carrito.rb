class Carrito < ApplicationRecord
  belongs_to :pasaje
  belongs_to :insumo
end