class AddStripIdToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :stripe_id, :string
  end
end
