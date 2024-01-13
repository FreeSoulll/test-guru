class User < ApplicationRecord
  has_many :test_results
  has_many :tests, through: :test_results
  has_many :created_tests, class_name: 'Test', foreign_key: 'creator_id'

  scope :complited_tests_by_level, ->(level) { joins(:tests).where(tests: { level: }) }

  validates :name, presence: true
end
