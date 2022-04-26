class AddColoumnToSeller < ActiveRecord::Migration[7.0]
  def up
    add_column :sellers, :name, :string
    add_column :sellers, :address, :text
    add_column :sellers, :mobile_number, :integer
  end
  def down
    remove_column :sellers, :name, :string
    remove_column :sellers, :address, :text
    remove_column :sellers, :mobile_number, :integer
  end
end
