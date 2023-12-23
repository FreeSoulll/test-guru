# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

questions = [
  { body: 'Who create Ruby?', tests_id: 1 },
  { body: 'Who create HTML?', tests_id: 2 },
  { body: 'Who create Java?', tests_id: 3 }
]

categories = [
  { title: 'Ruby' },
  { title: 'HTML' },
  { title: 'Java' }
]
tests = [
  { title: 'Ruby test', level: 4, category_id: 1 },
  { title: 'HTML test', level: 1, category_id: 2 },
  { title: 'Java test', level: 3, category_id: 3 }
]
users = [
  { name: 'Eric' },
  { name: 'Stan' },
  { name: 'Kenny' }
]

answers = [
  { body: 'Yukihiro "Matz" Matsumoto', correct: true, question_id: 1 },
  { body: 'Tim Berners-Lee', correct: true, question_id: 2 },
  { body: 'Me', correct: false, question_id: 3 }
]
User.create(users)
Category.create(categories)
Test.create(tests)
Question.create(questions)
Answer.create(answers)