ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name, :locale, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :locale
    column :created_at
    actions
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :locale
    end
    f.actions
  end
end
