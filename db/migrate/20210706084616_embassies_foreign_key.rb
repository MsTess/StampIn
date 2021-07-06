class EmbassiesForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_reference :embassies, :countries, foreign_key: true
  end
end
