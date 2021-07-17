class ChangeEmbassyColumnNames < ActiveRecord::Migration[6.0]
  def change
    remove_reference :embassies, :origin_country
    remove_reference :embassies, :destination_country
    add_reference :embassies, :own_country, null: false, foreign_key: {to_table: :countries}
    add_reference :embassies, :host_country, null: false, foreign_key: {to_table: :countries}
  end
end
