ActiveAdmin.register Seller do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :approved, :name, :address, :mobile_number
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :approved, :name, :address, :mobile_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  action_item :approved, only: :show do
    link_to "Approved", approved_admin_seller_path(seller), method: :put if !seller.approved?
  end


  member_action :approved, method: :put do
    seller = Seller.find(params[:id])
    seller.update(approved: true)
    Welcome1Mailer.send_greetings_to_seller__notification(seller).deliver_now
    redirect_to admin_seller_path(seller)
  end
   index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :approved
    actions
  end
end
