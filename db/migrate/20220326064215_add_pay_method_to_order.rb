class AddPayMethodToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :pay_methed, :string
  end
end
