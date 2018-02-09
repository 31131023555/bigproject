class Order < ApplicationRecord
  # def paypal_url(return_path)
  #   values = {
  #     business: "merchant@gotealeaf.com",
  #     cmd: "_xclick",
  #     upload: 1,
  #     return: "#{Rails.application.secrets.app_host}#{return_path}",
  #     invoice: 10,
  #     amount: 11,
  #     item_name: 'name here',
  #     item_number: 1,
  #     quantity: '1',
  #     notify_url: "#{Rails.application.secrets.app_host}/hook"
  #   }
  #   "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  # end
end