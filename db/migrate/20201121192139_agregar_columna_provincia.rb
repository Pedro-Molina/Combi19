class AgregarColumnaProvincia < ActiveRecord::Migration[6.0]
  def change
    add_column :lugars, :provincia, :string
  end
end
