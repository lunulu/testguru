class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  def tests_history(test_level)
    tests.where(level: test_level)
  end
end
