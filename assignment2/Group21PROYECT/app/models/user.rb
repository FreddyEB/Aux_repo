class User < ApplicationRecord
    has_many :user_to_boards
    has_many :boards, through: :user_to_boards
    has_many :tasks
    validates :name, presence: { message: "You have to fill in your username!" }
    validates :email, presence: { message: "You have to fill in your email!" }, uniqueness: { message: "This email is already in use" }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format" }
    validates :password, presence: { message: "You have to fill in your password!" }, length: { minimum: 6, message: "Password must be at least 6 characters long" }

    before_validation :downcase_email
    before_validation :normalize_name
    private
        def downcase_email
            self.email = email.downcase
        end
        def normalize_name
            self.name = name.downcase.titleize
        end
end