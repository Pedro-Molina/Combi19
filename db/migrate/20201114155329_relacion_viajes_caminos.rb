class RelacionViajesCaminos < ActiveRecord::Migration[6.0]
  def change
    change_table :viajes do |t|
      t.belongs_to :camino
    end
  end
end
