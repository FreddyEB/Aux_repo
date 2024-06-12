class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :team_memberships, dependent: :destroy
    has_many :teams, through: :team_memberships
    has_many :tasks, dependent: :destroy
    has_many :asignee_tasks, dependent: :destroy
    
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