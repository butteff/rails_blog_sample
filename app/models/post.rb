class Post < ApplicationRecord
  belongs_to :board
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [120, 120]
  end
end
