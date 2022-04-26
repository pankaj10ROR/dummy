class ProductsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		@q = Product.ransack(params[:q])
		@products = @q.result(distinct:true)
	end

  def show
    @product = Product.find(params[:id])
  end

	def new
		if seller_signed_in?
		@product = current_seller.products.new
	else
		@product = Product.new
	end
	end

	def create
		if seller_signed_in?
		@product = current_seller.products.new(product_params)
	else
			@product = Product.new(product_params)
		end

		if @product.save
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def list_of_product
		@products = current_seller.products.where(approved:true)
	end

	def unapproved_product
		@products = current_seller.products.where(approved:false)
	end

	private
	def product_params
		params.require(:product).permit(:product_name, :company_name, :description, :price, :avatar, :approved, :seller_email)
	end
end
