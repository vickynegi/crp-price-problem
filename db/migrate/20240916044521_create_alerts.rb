class CreateAlerts < ActiveRecord::Migration[7.1]
  def up
    create_table :alerts do |t|
      t.string      :status, :null => false, :default => 'created'
      t.string      :crypto_currency
      t.decimal     :target_price
      t.text        :description
      t.references  :user, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :alerts
  end
end
