class AddTrackableValueToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :trackable_value, :string
  end
end
