class AddBigimgFieldToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :largeimgurl, :string    
  end
end
