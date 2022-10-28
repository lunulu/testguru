module Badges
  class TestCountRule < AbstractRuleSpecification
    def satisfies?
      return false unless @value.to_i > 0

      @user.tests.count >= @value.to_i
    end
  end
end
