class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer       :quantity, default: 1
      t.references    :product, foreign_key: true
      t.references    :order, foreign_key: true
      t.float         :adjustment_total
      t.float         :price
      t.jsonb         :metadata, default: {}
      t.timestamps
    end
  end
end
