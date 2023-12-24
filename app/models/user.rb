class User < ApplicationRecord
  has_many :test_results
  has_many :tests, through: :test_results

  def complited_tests_by_level(level)
    Test.includes(:test_results).where(test_results: { user_id: id }, level:)
  end
end
