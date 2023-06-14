class Comment < ApplicationRecord
    belongs_to :author, class_name: "User"
    belongs_to :post
    validates :body, :author_id, :post_id, presence: true

    has_many :commentships, dependent: :destroy
    has_many :comment_childs, through: :commentships
end
