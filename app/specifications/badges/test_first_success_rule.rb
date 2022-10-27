module Badges
  class TestFirstSuccessRule < AbstractRuleSpecification
    def satisfies?
      @user.test_passages.map(&:success?).include?(true)
    end
  end
end
