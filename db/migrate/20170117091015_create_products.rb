class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string        :name
      t.text          :description
      t.string        :sku
      t.string        :meta_title
      t.string        :meta_tags
      t.text          :meta_description
      t.string        :tags
      t.jsonb         :metadata,        default: {}
      t.datetime      :available_from
      t.datetime      :available_upto
      t.float         :selling_price
      t.float         :cost_price
      t.float         :tax_rate,        default: 0.0
      t.integer       :status,          default: 0
      t.integer       :owner_id
      t.string        :payload
      t.timestamps
    end
    add_index         :products, :name
    add_index         :products, :sku, unique: true
  end
end
