class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  belongs_to :category

  has_many :users, through: :test_passages
  has_many :test_passages

  def self.all_by_category(category_title)
    joins(:category).where(categories: { title: category_title }).order(title: :desc)
  end
end
