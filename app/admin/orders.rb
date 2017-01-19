ActiveAdmin.register Order do
  actions :index, :show

  filter :total
  filter :completed_at

  index do
    column('Order', sortable: :id) do |order|
      link_to "##{order.number}", super_user_order_path(order)
    end
    column("Amount") {|order| number_to_currency(order.total)}
    column("Status") {|order| span(class: 'label label-primary') {order.status}}
  end

  show do
    panel "Invoice" do
      table_for(order.line_items) do |t|
        t.column("Product") {|item| auto_link item.product        }
        t.column("Price")   {|item| number_to_currency item.product.selling_price }
        t.column("Tax")   {|item| number_to_percentage item.product.tax_rate }
        t.column("Quantity")   {|item| item.quantity }
        tr :class => "odd" do
          td "Total:", :style => "text-align: right;"
          td number_to_currency(order.total)
        end
        tr :class => "even" do
          td "Total Inc. Tax:", :style => "text-align: right;"
          td number_to_currency(order.total + order.total_tax)
        end
      end
    end

    default_main_content

  end
end
