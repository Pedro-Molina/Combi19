class RelacionPasajeInsumo < ActiveRecord::Migration[6.0]
  def change
        create_table :carritos do |t|
          t.belongs_to :pasaje
          t.belongs_to :insumo
        end
  end
end
