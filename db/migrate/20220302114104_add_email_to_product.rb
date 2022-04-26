class AddEmailToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :seller_email, :string
  end
end
