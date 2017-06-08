class HashtagQuestion < ApplicationRecord
  validates :question_id, uniqueness: {scope: :hashtag_id}
end
