class RelacionCaminoLugar < ActiveRecord::Migration[6.0]
  def change
    change_table :caminos do |t|
      t.belongs_to :origen
      t.belongs_to :destino
    end
  end
end
