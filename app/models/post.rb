class Post < ApplicationRecord
    belongs_to :author, class_name: "User"
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :author_id, presence: true
end
