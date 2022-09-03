class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_many :created_tests, class_name: 'Test'

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def started_tests_by_level(test_level)
    tests.where(level: test_level)
  end
end
