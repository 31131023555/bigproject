class AddAmountPayerIdCanceledTokenToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :amount, :integer, default: 1
    add_column :payments, :token, :string
    add_column :payments, :canceled, :boolean, default: false
    add_column :payments, :payer_id, :string
  end
end
