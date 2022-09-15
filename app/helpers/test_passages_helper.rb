module TestPassagesHelper
  def result_message(test_passage)
    if test_passage.correct_questions / test_passage.test.questions.count.to_f >= 0.85
      "<p class='green-text'>Test passed</p>".html_safe
    else
      "<p class='red-text'>Test failed</p>".html_safe
    end
  end

  def current_question_number(test_passage)
    test_passage.test.questions.index(test_passage.current_question) + 1
  end
end
