class User < ApplicationRecord
  has_many :test_results
  has_many :tests, through: :test_results

  def complited_tests_by_level(level)
    Test.joins(:users).where('users.id': id, level:)
  end
end
