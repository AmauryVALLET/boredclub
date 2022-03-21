class Ape < ApplicationRecord
    has_many :reviews, dependent: :destroy
end
