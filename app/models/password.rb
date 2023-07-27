class Password < ApplicationRecord
    has_secure_password
    belongs_to :user

    validates :website, presence: true
    validates :username, presence: true
    validates :password, presence: true, length: { minimum: 6 }
end
