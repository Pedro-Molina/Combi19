class Combi < ApplicationRecord
  validates :patente, presence:true, uniqueness:true
  validates :capacidad, presence:true, numericality: true
  validates :modelo, presence:true
  #has_many :viajes


  def custom_label_method
		"#{self.patente}"
	end

    rails_admin do
        exclude_fields :created_at, :updated_at
    end
    
end
