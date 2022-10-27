module Badges
  class TestFirstTryRule < AbstractRuleSpecification
    def satisfies?
      return false if Test.ids.exclude? @value.to_i

      @user.test_passages.where(test_id: @value.to_i).count == 1 && @user.test_passages.where(test_id: @value).first.success?
    end
  end
end
