class AddPasswordDigestToPasswords < ActiveRecord::Migration[7.0]
  def change
    add_column :passwords, :password_digest, :string
  end
end
