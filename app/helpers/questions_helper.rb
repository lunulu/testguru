module QuestionsHelper
  def question_header(question)
    if question.new_record?
      I18n.t('questions_helper.question_header.create', test_title: question.test.title)
    else
      I18n.t('questions_helper.question_header.edit', test_title: question.test.title)
    end
  end
end
