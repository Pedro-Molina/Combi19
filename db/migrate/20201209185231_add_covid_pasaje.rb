class AddCovidPasaje < ActiveRecord::Migration[6.0]
  def change
  	add_column :pasajes, :covid, :boolean
  end
end
