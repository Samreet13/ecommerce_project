ActiveAdmin.register Customer do
  actions :index, :show

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :email
    column("Orders") { |c| c.orders.count }
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :phone
      row :province
    end

    panel "Order History" do
      table_for customer.orders do
        column :id
        column :status
        column :subtotal
        column :tax_total
        column :grand_total
        column("Items") do |order|
          order.order_items.map { |i| "#{i.product.name} x#{i.quantity}" }.join(", ")
        end
        column :created_at
      end
    end
  end
end