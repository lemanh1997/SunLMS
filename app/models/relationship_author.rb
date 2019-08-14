class RelationshipAuthor < ApplicationRecord
  belongs_to :author_f, class_name: "Author"
  belongs_to :user_f, class_name: "User"
  validates :author_f_id, presence: true
  validates :user_f_id, presence: true
end
