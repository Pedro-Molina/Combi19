class RelacionViajePasajero < ActiveRecord::Migration[6.0]
  def change
        create_table :users_viajes, id: false do |t|
          t.belongs_to :viaje
          t.belongs_to :user
        end
  end
end
