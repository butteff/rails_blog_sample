class Board < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [250, 250]
    attachable.variant :preview, resize_to_limit: [90, 90]
  end
end
