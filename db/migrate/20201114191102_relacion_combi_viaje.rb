class RelacionCombiViaje < ActiveRecord::Migration[6.0]
  def change
    change_table :viajes do |t|
      t.belongs_to :combi
    end
  end
end
