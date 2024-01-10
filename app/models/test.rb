class Test < ApplicationRecord
  has_many :test_results
  has_many :users, through: :test_results
  has_many :questions
  belongs_to :category
  belongs_to :creator, class_name: 'User'

  def self.sorted_tests(category)
    Test.joins(:category).order(title: :desc).where('category.title': category).pluck(:title)
  end
end
