class Insumo < ApplicationRecord

  has_many :carritos
  has_many :pasajes, :through => :carritos

  validates :precio, presence: true
  validates :nombre, presence:true , uniqueness:true

    def custom_label_method
		"#{self.nombre}"
	 end
	
    rails_admin do
        exclude_fields :created_at, :updated_at, :carritos, :pasajes
    end
end
