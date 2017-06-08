class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :hashtag_questions
  has_many :hashtags, through: :hashtag_questions
  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }


  before_save :set_hashtags


  private

  def set_hashtags

  end
end
