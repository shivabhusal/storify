class CartMailer < ApplicationMailer
  def deliver(order_id)
    order = Order.find(order_id)
    order.products.each do |product|
      begin
      filename = product.payload.file.filename
      attachments[filename.to_s] = File.read(product.payload.file.file)
      rescue NoMethodError

      end
    end
    mail(to: order.customer.email, from: 'support@storify.net', subject: 'Product delivery')
    order.delivered!
  end
end
