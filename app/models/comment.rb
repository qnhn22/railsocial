class Comment < ApplicationRecord
    belongs_to :author, class_name: "User"
    belongs_to :post
    validates :body, presence: true

    has_many :replies, class_name: "Comment", foreign_key: :parent_comment_id, dependent: :destroy
    belongs_to :parent_comment, class_name: "Comment", optional: true

    # has_many :commentships, dependent: :destroy
    # has_many :comment_childs, through: :commentships
end
