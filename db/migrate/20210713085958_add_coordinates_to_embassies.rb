class AddCoordinatesToEmbassies < ActiveRecord::Migration[6.0]
  def change
    add_column :embassies, :latitude, :float
    add_column :embassies, :longitude, :float
  end
end
