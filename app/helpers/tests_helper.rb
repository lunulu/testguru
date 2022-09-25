module TestsHelper
  TEST_LEVELS = { 0 => 'very_easy',
                  1 => 'easy',
                  2 => 'medium',
                  3 => 'hard',
                  4 => 'very_hard',
                  5 => 'extreme' }.freeze
  def test_level(test)
    TEST_LEVELS[test.level] || 'god'
  end
end
