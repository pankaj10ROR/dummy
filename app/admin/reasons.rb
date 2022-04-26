ActiveAdmin.register Reason do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :question, :answer, :product_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:question, :answer, :product_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  

  index do
    selectable_column
      id_column
      column :question
      column :answer
      actions
    end

    index as: :grid do |reason|
      link_to 'Reason', admin_reason_path(reason)
    end
end

