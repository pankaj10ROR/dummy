class Wishlist < ApplicationRecord
	has_many :wish_items, dependent: :destroy
  has_many :products, through: :wish_items
  belongs_to :customer
end
