# Preview all emails at http://localhost:3000/rails/mailers/acots_mailer
class AcotsMailerPreview < ActionMailer::Preview
  def transaction_email_preview
    AcotsMailer.transaction_email(Order.last)
  end
end
