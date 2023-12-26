# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  [
    { name: 'Eric' },
    { name: 'Stan' },
    { name: 'Kenny' }
  ]
)

category = Category.create(
  [
    { title: 'Ruby' },
    { title: 'HTML' },
    { title: 'Java' }
  ]
)

test1 = Test.create(
  [
    { title: 'Ruby test', level: 4, category_id: category[0].id },
    { title: 'HTML test', level: 1, category_id: category[1].id },
    { title: 'Java test', level: 3, category_id: category[2].id }
  ]
)

question = Question.create(
  [
    { body: 'Who create Ruby?', tests_id: test1[0].id },
    { body: 'Who create HTML?', tests_id: test1[1].id },
    { body: 'Who create Java?', tests_id: test1[2].id }
  ]
)

answer = Answer.create(
  [
    { body: 'Yukihiro "Matz" Matsumoto', correct: true, question_id: question[0].id },
    { body: 'Tim Berners-Lee', correct: true, question_id: question[1].id },
    { body: 'Me', correct: false, question_id: question[2].id }
  ]
)

test_result = TestResult.new
test_result.user = User.find(1)
test_result.test = Test.find(1)
test_result.save
