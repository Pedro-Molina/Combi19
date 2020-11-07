class CreateCombis < ActiveRecord::Migration[6.0]
  def change
    create_table :combis do |t|
      t.string :patente
      t.string :modelo
      t.integer :capacidad
      t.boolean :super_comoda

      t.timestamps
    end
  end
end
