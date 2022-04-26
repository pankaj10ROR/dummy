class CreateReasons < ActiveRecord::Migration[7.0]
  def change
    create_table :reasons do |t|
      t.string :question
      t.string :answer
      t.integer :seller_id

      t.timestamps
    end
  end
end
