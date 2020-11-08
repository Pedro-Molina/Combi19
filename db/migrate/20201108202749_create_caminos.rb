class CreateCaminos < ActiveRecord::Migration[6.0]
  def change
    create_table :caminos do |t|
      t.string :camino

      t.timestamps
    end
  end
end
