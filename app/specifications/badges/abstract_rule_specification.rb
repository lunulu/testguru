module Badges
  class AbstractRuleSpecification
    def initialize(user:, value:)
      @user = user
      @value = value
    end

    def satisfies?
      raise "#{__method__} undefined for #{self.class}"
    end
  end
end
