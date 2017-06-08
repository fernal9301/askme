class Hashtag < ApplicationRecord
  validates :name, uniqueness: true
end
