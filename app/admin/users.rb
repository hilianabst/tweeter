ActiveAdmin.register User do
  
  
 
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :profile_photo, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :profile_photo, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  

  # member_action :lock, method: :put do
  #   resource.lock!
  #   redirect_to resource_path, notice: "Locked!"
  # end

  # action_item :view, only: :show do
  #   link_to 'View on site'
  # end

index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :status
    actions
  end
  action_item :status do
    link_to "suspended", admin_user_path(:id)
  end

  member_action :lock, method: :put do
    resource.lock!
    link_to 'bloquear', (redirect_to resource_path), notice: "Locked!"
  end


end
