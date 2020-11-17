class AddTarjeta < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :FechaExpiracion, :Date
  end
end
