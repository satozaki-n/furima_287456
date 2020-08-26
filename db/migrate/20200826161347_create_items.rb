class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :image
      t.string      :name
      t.text        :info
      t.integer     :category
      t.integer     :sales_status
      t.integer     :shipping_fee_status
      t.integer     :prefecture
      t.integer     :scheduled_delivery
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end
