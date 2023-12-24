# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

questions = [
  { body: 'Who create Ruby?', tests_id: Test.find_by(title: 'Ruby test') },
  { body: 'Who create HTML?', tests_id: Test.find_by(title: 'HTML test') },
  { body: 'Who create Java?', tests_id: Test.find_by(title: 'Java test') }
]

categories = [
  { title: 'Ruby' },
  { title: 'HTML' },
  { title: 'Java' }
]
tests = [
  { title: 'Ruby test', level: 4, category_id: Category.find_by(title: 'Ruby') },
  { title: 'HTML test', level: 1, category_id: Category.find_by(title: 'HTML') },
  { title: 'Java test', level: 3, category_id: Category.find_by(title: 'Java') }
]
users = [
  { name: 'Eric' },
  { name: 'Stan' },
  { name: 'Kenny' }
]

answers = [
  { body: 'Yukihiro "Matz" Matsumoto', correct: true, question_id: Question.find_by(body: 'Who create Ruby?') },
  { body: 'Tim Berners-Lee', correct: true, question_id: Question.find_by(body: 'Who create HTML?') },
  { body: 'Me', correct: false, question_id: Question.find_by(body: 'Who create Java?') }
]

User.create(users)
Category.create(categories)
Test.create(tests)
Question.create(questions)
Answer.create(answers)

test_result = TestResult.new
test_result.user = User.find(1)
test_result.test = Test.find(1)
test_result.save
