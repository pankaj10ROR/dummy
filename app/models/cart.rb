class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  belongs_to :customer

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)

    if current_item
      current_item.increment(:quantity)
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
  
  
  def sub_total
    sum = 0
    self.line_items.each do |line_item|
      sum+= line_item.total_price
    end
    return sum
  end
end
