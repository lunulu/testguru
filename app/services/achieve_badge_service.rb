class AchieveBadgeService
  def check_badges(user:)
    Badge.find_each do |badge|
      send(badge.rule_name + '_rule', badge.rule_value, badge)
    end
  end

  def self.rules
    private_instance_methods(false).map(&:to_s).filter { |name| name.include? '_rule' }.map { |name| name.delete_suffix('_rule')}.sort
  end

  private

  def category_all_by_title_rule(value, badge)
    return unless Category.pluck(:title).include? value

    if completed_tests_count_by_category_title(value) == tests_count_by_category_title(value)
      give_badge(badge)
    end
  end

  def category_count_rule(value, badge)
    return unless value.to_i > 0

    if @user.tests.where(category_id: category_id_by_title(title)) >= value.to_i
      give_badge(badge)
    end
  end

  def test_count_rule(value, badge)
    return unless value.to_i > 0

    if @user.tests.count >= value.to_i
      give_badge(badge)
    end
  end

  def test_first_success_rule(value, badge)
    if @user.test_passages.map(&:success?).include?(true)
      give_badge(badge)
    end
  end

  def test_all_by_level_rule(value, badge)
    return if value.to_i > Test::MAX_LEVEL

    if @user.tests.distinct.where(level: value.to_i).count == Test.where(level: value.to_i).count
      give_badge(badge)
    end
  end

  def test_first_try_rule(value, badge)
    return if Test.ids.exclude? value.to_i

    if @user.test_passages.where(test_id: value.to_i).count == 1 && @user.test_passages.where(test_id: value).first.success?
      give_badge(badge)
    end
  end

  def tests_count_by_category_title(title)
    Test.where(category_id: category_id_by_title(title)).count
  end

  def completed_tests_count_by_category_title(title)
    Test.where(id: @user.tests.distinct.pluck(:id)).where(category_id: category_id_by_title(title)).count
  end

  def category_id_by_title(title)
    Category.find_by(title: title).id
  end

  def give_badge(badge)
    if badge.multiple
      @user.user_badges.create(badge_id: badge.id)
    elsif @user.badges.exclude? badge
      @user.user_badges.create(badge_id: badge.id)
    end
  end
end
