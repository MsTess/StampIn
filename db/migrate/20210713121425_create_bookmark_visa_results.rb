class CreateBookmarkVisaResults < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmark_visa_results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :visa_result, null: false, foreign_key: true

      t.timestamps
    end
  end
end
