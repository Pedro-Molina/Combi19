class Combi < ApplicationRecord
  validates :patente, presence:true, uniqueness:true
  validates :capacidad, presence:true, numericality: true
  validates :modelo, presence:true
  #has_many :viajes


  def custom_label_method
		"#{self.modelo}"
	end
end
