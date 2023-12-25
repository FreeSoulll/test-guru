# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: 'Eric')
user2 = User.create(name: 'Stan')
user3 = User.create(name: 'Kenny')

category1 = Category.create(title: 'Ruby')
category2 = Category.create(title: 'HTML')
category3 = Category.create(title: 'Java')

test1 = Test.create(title: 'Ruby test', level: 4, category_id: category1.id)
test2 = Test.create(title: 'HTML test', level: 1, category_id: category2.id)
test3 = Test.create(title: 'Java test', level: 3, category_id: category3.id)

question1 = Question.create(body: 'Who create Ruby?', tests_id: test1.id)
question2 = Question.create(body: 'Who create HTML?', tests_id: test2.id)
question3 = Question.create(body: 'Who create Java?', tests_id: test3.id)

answer1 = Answer.create(body: 'Yukihiro "Matz" Matsumoto', correct: true, question_id: question1.id)
answer2 = Answer.create(body: 'Tim Berners-Lee', correct: true, question_id: question2.id)
answer3 = Answer.create(body: 'Me', correct: false, question_id: question3.id)

test_result = TestResult.new
test_result.user = User.find(1)
test_result.test = Test.find(1)
test_result.save
