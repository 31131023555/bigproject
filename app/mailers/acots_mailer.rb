class AcotsMailer < ApplicationMailer
  default from: 'furybin@gmail.com'
 
  def transaction_email(order)
    @user = User.find(order.user_id)
    @cart = Cart.find(order.cart_id)
    mail(to: @user.email, subject: 'Transaction Complete')
  end
end
