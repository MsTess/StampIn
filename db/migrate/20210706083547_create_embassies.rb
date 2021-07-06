class CreateEmbassies < ActiveRecord::Migration[6.0]
  def change
    create_table :embassies do |t|
      t.string :Embassy_Of
      t.string :In_Country
      t.string :In_City
      t.string :Embassy_hijo_h3
      t.string :Embassy_Consulate
      t.string :Address
      t.string :Address_link_GMaps
      t.string :Emails
      t.string :URL

      t.timestamps
    end
  end
end
