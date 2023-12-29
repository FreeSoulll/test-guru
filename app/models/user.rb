class User < ApplicationRecord
  has_many :test_results
  has_many :tests, through: :test_results
  has_many :created_tests, class_name: 'Test', foreign_key: 'creator_id'

  def complited_tests_by_level(level)
    Test.joins(:test_results).where(test_results: { user_id: id }, level:)
  end
end
