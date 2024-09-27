class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie_id, uniqueness: { scope: :list_id, message: "Le couple movie et list doit être unique" }
  validates :comment, length: { minimum: 6 }
end
