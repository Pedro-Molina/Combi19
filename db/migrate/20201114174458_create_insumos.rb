class CreateInsumos < ActiveRecord::Migration[6.0]
  def change
    create_table :insumos do |t|
      t.string :nombre
      t.float :precio

      t.timestamps
    end
  end
end
