ActiveAdmin.register User do
  permit_params :name, :mobile, :address, :email, :password, :password_confirmation, role_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :mobile
    column :address
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :roles
    actions
  end
  filter :name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :mobile
      f.input :address
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :check_boxes
    end
    f.actions
  end

end
