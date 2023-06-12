class Comment < ApplicationRecord
    belongs_to :author, class_name: "User"
    belongs_to :post
    validates :body, :author_id, :post_id, presence: true
end
