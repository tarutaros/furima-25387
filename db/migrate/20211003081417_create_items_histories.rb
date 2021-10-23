class CreateItemsHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :items_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
