class Comment < ApplicationRecord
  include Visible
  belongs_to :article

  validates :commenter, presence: true
  validates :commenter, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters" }
  validates :body, presence: true, length: { minimum: 10, maximum: 256 }
  validates :article_id, presence: true, numericality: { only_integer: true }
end
