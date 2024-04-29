class Task < ApplicationRecord
    belongs_to :user 
    belongs_to :state
   
    # has_many :child_posts, class_name: "Post", foreign_key: "parent_post_id"
    # has_many :post_tags
    # has_many :tags, through: :post_tags
 
    # validates :title, :content, :user_id, presence: { message: "This field can't be blank" }
    # validates :answers_count, :likes_count, numericality: { greater_than_or_equal_to: 0, message: "Values must be equal or greater than 0"}
    # before_validation :set_published_at_default
 
    # private
    #  def set_published_at_default
    #   self.published_at ||= Time.current
    #  end
 end