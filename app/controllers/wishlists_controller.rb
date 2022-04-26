class WishlistsController < ApplicationController
  def show
    @wishlist = @current_wishlist
  end

  def destroy
    @wishlist = @current_wishlist
    @wishlist.destroy
    session[:wishlist_id] = nil
    redirect_to root_path
  end
end
