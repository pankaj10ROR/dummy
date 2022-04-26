class WishItemsController < ApplicationController

def create
  chosen_product = Product.find(params[:product_id])
  current_wishlist = @current_wishlist

  
  if current_wishlist.products.include?(chosen_product)
    # Find the line_item with the chosen_product
    @wish_item = current_wishlist.wish_items.find_by(:product_id => chosen_product)
    # Iterate the line_item's quantity by one
    @wish_item.quantity += 1
  else
    @wish_item = WishItem.new
    @wish_item.wishlist = current_wishlist
    @wish_item.product = chosen_product
  end

  # Save and redirect to cart show path
  @wish_item.save
  redirect_to request.referrer
end


def destroy
  @wish_item = WishItem.find(params[:id])
  @wish_item.destroy
  redirect_to wishlist_path(@current_wishlist)
  #redirect_to request.referrer
end  



private
  def wish_item_params
    params.require(:wish_item).permit(:quantity,:product_id, :wishlist_id)
  end
end
