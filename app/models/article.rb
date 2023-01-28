class Article < ApplicationRecord
	include Visible
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates :title, presence: true
	validates :title, format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters" }
  	validates :body, presence: true, length: { minimum: 10 }
  	validates :user_id, presence: true, numericality: { only_integer: true }
end
