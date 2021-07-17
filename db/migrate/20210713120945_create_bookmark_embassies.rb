class CreateBookmarkEmbassies < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmark_embassies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :embassy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
