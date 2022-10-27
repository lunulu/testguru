class AchieveBadgeService
  RULES = {
    category_all_by_title: Badges::CategoryAllByTitleRule,
    test_count: Badges::TestCountRule,
    test_first_success: Badges::TestFirstSuccessRule,
    test_all_by_level: Badges::TestAllByLevelRule,
    test_first_try: Badges::TestFirstTryRule,
  }.freeze

  class << self
    def call(user:)
      @user = user

      Badge.find_each do |badge|
        rule = RULES[badge.rule_name.to_sym].new(user: @user, value: badge.rule_value)
        give_badge(badge) if rule.satisfies?
      end
    end

    def give_badge(badge)
      if badge.multiple
        @user.user_badges.create(badge_id: badge.id)
      elsif @user.badges.exclude? badge
        @user.user_badges.create(badge_id: badge.id)
      end
    end
  end

  private_class_method :give_badge
end
