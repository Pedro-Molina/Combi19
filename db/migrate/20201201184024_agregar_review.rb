class AgregarReview < ActiveRecord::Migration[6.0]
  def change
    add_column :pasajes, :comentario, :string
    add_column :pasajes, :puntaje, :integer
  end
end
