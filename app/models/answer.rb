class Answer < ApplicationRecord
  NUMBER_OF_PERMITTED_ANSWERS = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :questions_answers_limit

  private

  def questions_answers_limit
    if question_id && question.answers.count >= NUMBER_OF_PERMITTED_ANSWERS
      errors.add(:question_id, 'Answer cannot be added to that question')
    end
  end
end
