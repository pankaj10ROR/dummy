class AddLockableAttributeToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :failed_attempts, :integer, default: 0
    add_column :customers, :unlock_token, :string
    add_column :customers, :locked_at, :datetime
    add_index :customers, :unlock_token
  end
end
