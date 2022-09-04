class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test

  validates_uniqueness_of :user_id, scope: :test_id
end
