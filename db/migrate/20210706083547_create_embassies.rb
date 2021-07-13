class CreateEmbassies < ActiveRecord::Migration[6.0]
  def change
    create_table :embassies do |t|
      t.string :in_city
      t.string :embassy_hijo_h3
      t.string :embassy_consulate
      t.string :address
      t.string :address_link_gmaps
      t.string :emails
      t.string :url

      t.timestamps
    end
  end
end
