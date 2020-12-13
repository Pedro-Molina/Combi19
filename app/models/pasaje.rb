class Pasaje < ApplicationRecord
  belongs_to :viaje
  belongs_to :user

  has_many :carritos
  has_many :insumos, :through => :carritos
end