class CreateVisaResults < ActiveRecord::Migration[6.0]
  def change
    create_table :visa_results do |t|
      t.string :visa_modality
      t.string :evisa_modality

      t.timestamps
    end
  end
end
