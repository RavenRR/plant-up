class ChangePasswordToPasswordDigest < ActiveRecord::Migration
  def change
    remove_column :users, :password, :String
    add_column :users, :password_digest, :string
  end
end
