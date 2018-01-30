class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price, precision: 6, scale: 2
      t.string :imgurl
      t.text :description

      t.timestamps
    end
  end
end
