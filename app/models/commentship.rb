class Commentship < ApplicationRecord
    belongs_to :comment
    belongs_to :comment_child, class_name: "Comment"
end
