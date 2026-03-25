class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.decimal :gst_rate
      t.decimal :pst_rate
      t.decimal :hst_rate
      t.decimal :subtotal
      t.decimal :tax_total
      t.decimal :grand_total
      t.string :stripe_payment_id
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
