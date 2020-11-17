class Insumo < ApplicationRecord
  validates :precio, presence: true
  validates :nombre, presence:true , uniqueness:true

    def custom_label_method
		"#{self.nombre}"
	end
end
