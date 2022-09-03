class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :category

  has_many :users, through: :test_passages
  has_many :test_passages

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :all_by_category, ->(category_title) { joins(:category).where(categories: { title: category_title }) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.titles_by_category(category_title)
    all_by_category(category_title).order(title: :desc).pluck(:title)
  end
end
