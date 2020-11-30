class Insumo < ApplicationRecord
  validates :precio, presence: true
  validates :nombre, presence:true , uniqueness:true

    def custom_label_method
		"#{self.nombre}"
	end
	
    rails_admin do
        exclude_fields :created_at, :updated_at
    end
end
