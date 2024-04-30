class User < ApplicationRecord
    has_many :user_to_boards, class_name: 'UserToBoard'
    has_many :tasks
    validates :name, presence: { message: "You have to fill in your username!" }
    validates :email, presence: { message: "You have to fill in your email!" }, uniqueness: { message: "This email is already in use" }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format" }
    validates :password, presence: { message: "You have to fill in your password!" }, length: { minimum: 6, message: "Password must be at least 6 characters long" }

    before_validation :downcase_email
    private
        def downcase_email
            self.email = email.downcase
        end
end