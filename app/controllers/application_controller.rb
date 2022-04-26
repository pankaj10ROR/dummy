class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  before_action :current_cart
  before_action :current_wishlist
  helper_method :cart_count_over_one
 
  private
    def current_cart
      if customer_signed_in?
        if current_customer.carts.present?
          cart = current_customer.carts.find_by(params[:id])
          if cart.present?
            @current_cart = cart
          else
            session[:cart_id] = nil
          end
        end

        if session[:cart_id] == nil
          @current_cart = current_customer.carts.create
          session[:cart_id] = @current_cart.id
        end
      end
    end

    def cart_count_over_one
    if @current_cart.line_items.count > 0
      return "<span class='tag is-dark'>#{@current_cart.line_items.count}</span>".html_safe
    end
  end

  def cart_has_items
    return @cart.line_item.count > 0
  end


#Wishlist---

private
    def current_wishlist
      if customer_signed_in?
        if current_customer.wishlists.present?
        wishlist = current_customer.wishlists.find_by(params[:id])
        if wishlist.present?
          @current_wishlist = wishlist
        else
          session[:wishlist_id] = nil
        end
      end

      if session[:wishlist_id] == nil
        @current_wishlist = current_customer.wishlists.create
        session[:wishlist_id] = @current_wishlist.id
      end
    end
end

end
