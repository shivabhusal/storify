class CartMailer < ApplicationMailer
  def deliver(order_id)
    order = Order.find(order_id)
    order.products.each do |product|
      filename = product.payload.filename
      attachments[filename.to_s] = product.payload.file
    end

    mail(to: order.customer.email, from: 'support@storify.net', subject: 'Product delivery')
  end
end
