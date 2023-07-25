class AddUserIdToPasswords < ActiveRecord::Migration[7.0]
  def change
    add_reference :passwords, :user, foreign_key: true, default: 0
  end
end
