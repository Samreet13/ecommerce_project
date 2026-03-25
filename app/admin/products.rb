ActiveAdmin.register Product do
  permit_params :name, :description, :price, :stock_quantity, 
                :on_sale, :sale_price, :image, category_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :stock_quantity
    column :on_sale
    column :sale_price
    column("Categories") { |p| p.categories.map(&:name).join(", ") }
    column :created_at
    actions
  end

  filter :name
  filter :on_sale
  filter :categories

  show do
    attributes_table do
      row :name
      row :description
      row :price
      row :stock_quantity
      row :on_sale
      row :sale_price
      row("Categories") { |p| p.categories.map(&:name).join(", ") }
      row("Image") { |p| image_tag(p.image) if p.image.attached? }
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :on_sale
      f.input :sale_price
      f.input :image, as: :file
      f.input :categories, as: :check_boxes, collection: Category.all
    end
    f.actions
  end
end