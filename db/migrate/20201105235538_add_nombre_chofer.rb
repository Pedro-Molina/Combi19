class AddNombreChofer < ActiveRecord::Migration[6.0]
  def change
  	add_column :chofers, :nombre, :string
  end
end
