ActiveAdmin.register Product do
  before_filter :only => [:show, :edit, :update, :delete] do
    @product = Product.friendly.find(params[:id])
  end

  menu :priority => 2
  permit_params :name, :description, :author, :payload, :selling_price, :cost_price, :available_from, :available_upto, pictures_attributes: [:id, :payload, :name, :_destroy]

  scope :all, :default => true

  scope :available do |products|
    products.where("available_from < ?", Date.today)
  end

  scope :drafts do |products|
    products.draft
  end

  scope :published do |products|
    products.published
  end

  index :as => :grid do |product|
    div do
      a :href => super_user_product_path(product) do
        image_tag(product.first_image || Config::DefaultCoverFileName, width: 200)
      end
    end
    a truncate(product.name), :href => super_user_product_path(product)
    div do
      product.categories.map do |x|
        span class: 'label label-primary' do
          [x.parent&.name, x.name].compact.join('>')
        end
      end.compact.join(', ')
    end
  end

  show do
    default_main_content
    ul do
      resource.pictures.each do |img|
        li class: 'col-md-4' do
          image_tag(img.payload, class: 'thumbnail img-responsive')
        end
      end
    end
  end

  sidebar :product_stats, :only => :show do
    attributes_table_for resource do
      row("Total Sold") { resource.line_items.sum(&:quantity) }
      # row("Dollar Value") { number_to_currency LineItem.where(:product_id => resource.id).sum(:price) }
    end
  end

  sidebar :recent_orders, :only => :show do
    resource.orders.limit(5).collect do |order|
      auto_link(order)
    end.join(content_tag("br")).html_safe
  end

  form title: 'New Product' do |f|
    inputs 'Details' do
      f.input :name
      input :description
      input :sku
      input :meta_title
      input :meta_tags
      input :meta_description
      input :tags
      input :cost_price
      input :selling_price
      input :payload
      input :available_from, label: "Publish Post At"
      input :available_upto, label: "Publish Post UpTo"
      li "Created at #{f.object.created_at}" unless f.object.new_record?
      input :categories
    end

    f.inputs 'Product Images' do
      f.has_many :pictures, allow_destroy: true do |t|
        t.input :payload, hint: image_tag(t.object.payload, width: 100)
        t.input :name
      end
    end

    actions
  end

end
