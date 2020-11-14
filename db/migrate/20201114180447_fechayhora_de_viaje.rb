class FechayhoraDeViaje < ActiveRecord::Migration[6.0]
  def change
    add_column :viajes, :FechayHora, :timestamp
  end
end
