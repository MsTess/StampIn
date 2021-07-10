class AddCountryReferencesToVisaResults < ActiveRecord::Migration[6.0]
  def change
    add_reference :visa_results, :origin_country, null: false, foreign_key: {to_table: :countries}
    add_reference :visa_results, :destination_country, null: false, foreign_key: {to_table: :countries}
  end
end
