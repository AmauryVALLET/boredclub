class Review < ApplicationRecord
  belongs_to :ape
  validates :content, length: { minimum: 20 }
end
