class Answer < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :questions_answers_limit

  private

  def questions_answers_limit
    return unless question && question.answers.count >= MAX_ANSWERS

    errors.add(:question_id, "can have a maximum of #{MAX_ANSWERS} answers.")
  end
end
