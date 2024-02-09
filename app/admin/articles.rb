ActiveAdmin.register Article do
  permit_params :title, :description, :user_id
  index do
    selectable_column
    id_column
    column :title
    column :description
    column :user
    actions
  end

  filter :title
  filter :created_at

  form do |f|
    f.inputs "Article" do
      f.input :title
      f.input :description
      f.input :user_id, as: :select, collection: User.all.map{ |user| [user.name, user.id]}
    end
    f.actions
  end  
end
