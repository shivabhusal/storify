ActiveAdmin.register Category do
  permit_params :name, :description, :parent_id

  form do |f|
    f.inputs "Category details" do
      f.input :name
      f.input :description
      f.input :parent, label: 'Parent Category'
    end

    f.actions
  end
end
