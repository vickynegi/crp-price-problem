class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string   :email,    null: false
      t.string   :first_name
      t.string   :last_name
      t.string   :mobile_no
      t.string   :address
      t.boolean  :active,   default: false
      t.string   :password_digest

      t.timestamps
    end
  end
end
