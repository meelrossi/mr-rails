class AddLocaleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :locale, :string
    User.update_all(locale: 'es')
  end
end
