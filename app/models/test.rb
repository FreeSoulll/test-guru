class Test < ApplicationRecord
  has_many :test_results
  has_many :users, through: :test_results
  belongs_to :category
  has_many :questions

  def self.sorted_tests(category)
    Test.joins(:category).order(title: :desc).where('category.title': category).pluck(:title)
  end
end
