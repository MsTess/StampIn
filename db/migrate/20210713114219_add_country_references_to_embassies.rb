class AddCountryReferencesToEmbassies < ActiveRecord::Migration[6.0]
  def change
    add_reference :embassies, :origin_country, null: false, foreign_key: {to_table: :countries}
    add_reference :embassies, :destination_country, null: false, foreign_key: {to_table: :countries}
  end
end
