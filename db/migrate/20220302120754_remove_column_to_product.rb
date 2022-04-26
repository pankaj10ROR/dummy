class RemoveColumnToProduct < ActiveRecord::Migration[7.0]
  def up
    remove_column :products, :image, :string
  end

  def down
    add_column :products, :image, :string
  end
end
