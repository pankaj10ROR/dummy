class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.text :address
      t.string :city
      t.string :state
      t.integer :pin_code

      t.timestamps
    end
  end
end
