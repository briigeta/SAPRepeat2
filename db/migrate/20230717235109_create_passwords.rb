class CreatePasswords < ActiveRecord::Migration[7.0]
  def change
    create_table :passwords do |t|
      t.string :website
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
