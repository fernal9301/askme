class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :hashtag_questions, dependent: :destroy
  has_many :hashtags, through: :hashtag_questions
  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  before_save :set_hashtags

  private

  def set_hashtags
    hashtag_questions.delete_all
    hashtags_unique = (text + ' ' + answer.to_s).scan(Hashtag::REGEXP).uniq
    hashtags_unique.each do |hashtag|
      hashtags << Hashtag.find_or_create_by(name: hashtag[1..-1])
    end
  end
end
