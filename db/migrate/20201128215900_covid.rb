class Covid < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :covid, :Date
  end
end
