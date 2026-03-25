ActiveAdmin.register Page do
  permit_params :title, :body

  # No delete or create — only edit existing seeded pages
  actions :index, :show, :edit, :update

  index do
    selectable_column
    id_column
    column :slug
    column :title
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :slug
      row :title
      row :body
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Edit Page Content" do
      f.input :slug, input_html: { disabled: true }
      f.input :title
      f.input :body, as: :text
    end
    f.actions
  end
end