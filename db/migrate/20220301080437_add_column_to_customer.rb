class AddColumnToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :name, :string
    add_column :customers, :address, :text
    add_column :customers, :mobile_number, :integer
  end
end
