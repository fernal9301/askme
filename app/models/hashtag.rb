class Hashtag < ApplicationRecord
  REGEXP = /#[[:alnum:]_]+/

  has_many :hashtag_questions, dependent: :destroy
  has_many :questions, through: :hashtag_questions

  validates :name, uniqueness: true
end
