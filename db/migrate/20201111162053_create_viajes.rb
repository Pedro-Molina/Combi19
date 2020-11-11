class CreateViajes < ActiveRecord::Migration[6.0]
  def change
    create_table :viajes do |t|

      t.timestamps
    end
  end
end
