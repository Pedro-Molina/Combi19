class CreateLugars < ActiveRecord::Migration[6.0]
  def change
    create_table :lugars do |t|
      t.string :lugar

      t.timestamps
    end
  end
end
