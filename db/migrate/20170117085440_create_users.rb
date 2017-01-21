class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string  :email, unique: true
      t.string  :country_code
      t.string  :phone_number
      t.string  :first_name
      t.string  :last_name
      t.string  :gender
      t.string  :avatar
      t.jsonb   :metadata,  default: {}
      t.string  :type
      t.integer :status,    default: 0

      t.timestamps
    end

    add_index   :users, :email, unique: true
  end
end
