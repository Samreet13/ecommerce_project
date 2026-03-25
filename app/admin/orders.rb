ActiveAdmin.register Order do
  permit_params :status

  actions :index, :show, :edit, :update

  index do
    selectable_column
    id_column
    column :customer
    column :status
    column :subtotal
    column :tax_total
    column :grand_total
    column :created_at
    actions
  end

  filter :status, as: :select, collection: Order.statuses
  filter :customer
  filter :created_at

  show do
    attributes_table do
      row :customer
      row :address
      row :status
      row :gst_rate
      row :pst_rate
      row :hst_rate
      row :subtotal
      row :tax_total
      row :grand_total
      row :stripe_payment_id
      row :created_at
    end

    panel "Order Items" do
      table_for order.order_items do
        column("Product") { |item| item.product.name }
        column :quantity
        column :unit_price
        column("Line Total") { |item| number_to_currency(item.line_total) }
      end
    end
  end

  form do |f|
    f.inputs "Update Order Status" do
      f.input :status, as: :select, collection: Order.statuses
    end
    f.actions
  end
end