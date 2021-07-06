class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :alpha2code
      t.string :capital
      t.string :timezones
      t.string :languages
      t.string :flag
      t.string :currencies
      t.string :demonym
      t.string :latlng
      t.integer :callingCodes

      t.timestamps
    end
  end
end
