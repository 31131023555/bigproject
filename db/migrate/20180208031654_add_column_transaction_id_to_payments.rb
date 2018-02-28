class AddColumnTransactionIdToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :transaction_id, :string
  end
end
