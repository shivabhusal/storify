class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :number
      t.float :total
      t.float :total_tax
      t.integer :status
      t.float :adjustment_total
      t.datetime :completed_at
      t.integer :payment_status

      t.timestamps
    end
  end
end
