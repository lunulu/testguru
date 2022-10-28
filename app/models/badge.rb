class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  default_scope { order(id: :asc) }

  validates :title, presence: true
  validates :image_location, presence: true
  validates :rule_name, presence: true
  validates :rule_value, presence: true
  validates :rule_name, uniqueness: { scope: :rule_value }
end
