class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 0.85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  before_update :before_update_set_next_question

  def completed?
    current_question.nil? || time_is_left?
  end

  def success?
    correct_questions / test.questions.count.to_f >= SUCCESS_RATIO
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def end_time
    created_at + test.time_limit
  end

  def time_left
    (end_time - Time.current).round
  end

  private

  def time_is_left?
    Time.current >= end_time
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    answer_ids = [] if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end
