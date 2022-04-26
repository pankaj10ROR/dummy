class AddLockableAttributeToSeller < ActiveRecord::Migration[7.0]
  def change
    add_column :sellers, :failed_attempts, :integer, default: 0
    add_column :sellers, :unlock_token, :string
    add_column :sellers, :locked_at, :datetime
    add_index :sellers, :unlock_token
  end
end
