module TestsHelper

  TEST_LEVELS = { 0 => I18n.t('tests_helper.very_easy'),
                  1 => I18n.t('tests_helper.easy'),
                  2 => I18n.t('tests_helper.medium'),
                  3 => I18n.t('tests_helper.hard'),
                  4 => I18n.t('tests_helper.very_hard'),
                  5 => I18n.t('tests_helper.extreme') }.freeze
  def test_level(test)
    TEST_LEVELS[test.level] || I18n.t('tests_helper.god')
  end
end
