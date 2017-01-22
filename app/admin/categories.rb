ActiveAdmin.register Category do
  form do |f|
    f.inputs "Category details" do
      f.input :name
      f.input :description
      f.input :parent, label: 'Parent Category'
    end

    f.actions
  end
end
