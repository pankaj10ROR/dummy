class AddInfoToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :uid, :string
    add_column :customers, :provider, :string
  end
end
