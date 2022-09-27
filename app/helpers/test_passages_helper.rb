module TestPassagesHelper
  def result_message(test_passage)
    if test_passage.success?
      "<p class='text-success'>#{I18n.t('.test_passages_helper.success')}</p>".html_safe
    else
      "<p class='text-danger'>#{I18n.t('.test_passages_helper.fail')}</p>".html_safe
    end
  end

  def current_question_number(test_passage)
    test_passage.test.questions.index(test_passage.current_question) + 1
  end
end
