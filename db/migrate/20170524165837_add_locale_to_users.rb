class AddLocaleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :locale, :string, default: 'es'
    User.update_all(locale: 'es')
  end
end
