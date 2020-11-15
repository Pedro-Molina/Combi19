class Insumo < ApplicationRecord

    def custom_label_method
		"#{self.nombre}"
	end
end
