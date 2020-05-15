ActiveAdmin.register User do
  
  
 
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
<<<<<<< HEAD
  # permit_params :name, :profile_photo, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
=======
  permit_params :name, :profile_photo, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :active
>>>>>>> 2e48a251abd03b2f95cecba81ac4814999e76049
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

<<<<<<< HEAD
index do
=======
  index do
>>>>>>> 2e48a251abd03b2f95cecba81ac4814999e76049
    selectable_column
    id_column
    column :email
    column :created_at
<<<<<<< HEAD
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
=======
    toggle_bool_column :active, if: proc { |user| user.active }
    actions
  end

  # member_action :lock, method: :put do
  #   resource.lock!
  #   link_to 'bloquear', (redirect_to resource_path), notice: "Locked!"
  # end
>>>>>>> 2e48a251abd03b2f95cecba81ac4814999e76049


end
