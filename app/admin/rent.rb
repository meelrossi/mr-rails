ActiveAdmin.register Rent do
  permit_params :user_id, :book_id, :from, :to
  form do |f|
    f.inputs do
      f.input :user_id,
              label: 'User',
              as: :select,
              collection: User.all.map { |u| [u.email, u.id] }
      f.input :book_id,
              label: 'Book',
              as: :select,
              collection: Book.all.map { |u| [u.title, u.id] }
      f.input :from
      f.input :to
    end
    f.actions
  end
end
