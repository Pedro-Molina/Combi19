class AddVarInsumos < ActiveRecord::Migration[6.0]
  def change
  	add_column :insumos, :descripcion, :string
  end
end
