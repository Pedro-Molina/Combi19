class AddVariablesUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :nombre, :string
  	add_column :users, :apellido, :string
  	add_column :users, :dni, :string
  	add_column :users, :tarjeta, :string
  end
end
