class RelacionChoferViaje < ActiveRecord::Migration[6.0]
  def change
    change_table :viajes do |t|
      t.belongs_to :chofer
    end
  end
end
