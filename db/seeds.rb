# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
  [
    { email: 'erick@mail.ru' },
    { email: 'stan@mail.ru' },
    { email: 'kenny@mail.ru' }
  ]
)

categories = Category.create(
  [
    { title: 'Ruby' },
    { title: 'HTML' },
    { title: 'Java' }
  ]
)

tests = Test.create(
  [
    { title: 'Ruby test', level: 4, category_id: categories[0].id, creator_id: users[0].id },
    { title: 'HTML test', level: 1, category_id: categories[1].id, creator_id: users[1].id },
    { title: 'Java test', level: 3, category_id: categories[2].id, creator_id: users[2].id }
  ]
)

questions = Question.create(
  [
    { body: 'Who create Ruby?', test_id: tests[0].id },
    { body: 'Who create HTML?', test_id: tests[1].id },
    { body: 'Who create Java?', test_id: tests[2].id }
  ]
)

answer = Answer.create(
  [
    { body: 'Yukihiro "Matz" Matsumoto', correct: true, question_id: questions[0].id },
    { body: 'Tim Berners-Lee', correct: true, question_id: questions[1].id },
    { body: 'Me', correct: true, question_id: questions[2].id }
  ]
)

test_passage = TestPassage.new
test_passage.user = User.first
test_passage.test = Test.first
test_passage.save
