module Badges
  class CategoryAllByTitleRule < AbstractRuleSpecification
    def satisfies?
      return false unless Category.pluck(:title).include? @value

      completed_tests_count_by_category_title(@value) == tests_count_by_category_title(@value)
    end

    private

    def tests_count_by_category_title(title)
      Test.where(category_id: category_id_by_title(title)).count
    end

    def completed_tests_count_by_category_title(title)
      Test.where(id: @user.tests.distinct.pluck(:id)).where(category_id: category_id_by_title(title)).count
    end
  end
end
