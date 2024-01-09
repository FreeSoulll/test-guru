class User < ApplicationRecord
  has_many :test_results
  has_many :tests, through: :test_results
  has_many :created_tests, class_name: 'Test', foreign_key: 'creator_id'

  def complited_tests_by_level(level)
    tests.where(level:)
  end
end
