class Order < ApplicationRecord
	has_many :line_items
	has_many :charges
	belongs_to :customer
end
