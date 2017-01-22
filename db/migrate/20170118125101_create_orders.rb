class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string      :number
      t.float       :total
      t.references  :user,            foreign_key: true
      t.float       :total_tax
      t.integer     :status,          default: 0
      t.float       :adjustment_total
      t.datetime    :completed_at
      t.integer     :payment_status,  default: 0

      t.timestamps
    end
    add_index       :orders, :number, unique: true
    add_index       :orders, :status
  end
end
