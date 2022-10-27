module Badges
  class TestAllByLevelRule < AbstractRuleSpecification
    def satisfies?
      return false if @value.to_i > Test::MAX_LEVEL

      @user.tests.distinct.where(level: @value.to_i).count == Test.where(level: @value.to_i).count
    end
  end

end
