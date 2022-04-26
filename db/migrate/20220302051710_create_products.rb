class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :company_name
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
