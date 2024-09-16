class User < ApplicationRecord
	acts_as_paranoid

	has_secure_password

	has_many :alerts

	validates :email, presence: true, uniqueness: true
end
