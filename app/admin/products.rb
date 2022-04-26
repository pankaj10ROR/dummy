ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :product_name, :company_name, :description, :price, :seller_id, :approved, :seller_email, :avatar

  action_item :approved, only: :show do
    link_to "Approved", approved_admin_product_path(product), method: :put if !product.approved?
  end


  member_action :approved, method: :put do
    product = Product.find(params[:id])
    product.update(approved: true)
    redirect_to admin_product_path(product)
  end

  index do
    selectable_column
    id_column
    column :product_name
    column :company_name
    column :seller_email
    column :approved
    column :price
    actions
  end

end
