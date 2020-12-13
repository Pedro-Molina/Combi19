class AddCantidadCarrito < ActiveRecord::Migration[6.0]
  def change
  	add_column :carritos, :cantidad, :integer, :default => 1
  end
end
