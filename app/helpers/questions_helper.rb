module QuestionsHelper

  ACTIONS = { new: 'Create new', edit: 'Edit' }.freeze
  def question_header(action, test)
    "#{ACTIONS[action]} #{test.title} Question"
  end
end
