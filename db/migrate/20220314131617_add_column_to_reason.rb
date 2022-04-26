class AddColumnToReason < ActiveRecord::Migration[7.0]
  def change
    add_column :reasons, :seller_email, :string
  end
end
