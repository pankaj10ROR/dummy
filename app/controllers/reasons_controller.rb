class ReasonsController < ApplicationController
	def create
		
		@product = current_seller.products.find(params[:product_id])
		@reason = @product.reasons.create(reason_params)
			redirect_to products_list_of_product_path
	end

	private
	def reason_params
		params.require(:reason).permit(:question, :answer, :seller_id, :seller_email)
	end
end
