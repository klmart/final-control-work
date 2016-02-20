# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user
User.create!(name: 'admin', email: 'admin@gmail.com', password: 'password' )

#tests
counter = 0
description = 'Это Самый лучший тест который вы можете написать'
tests = []

5.times do
  counter += 1
  tests.push Test.create!(name: 'Тест №' + "#{counter}", description: description)
end


#Questions
question_counter = 0
question_content = 'Вопрос №'
questions = []
20.times do
  question_counter += 1
  questions.push Question.create!(content: question_content + "#{question_counter}", test: tests.sample)
end

#Answers
question_id_counter = -1
answers = []
20.times do
  question_id_counter += 1
  answers.push Answer.create!(question:questions[question_id_counter], content: "Ответ №1", answer_status: false)
  answers.push Answer.create!(question:questions[question_id_counter], content: "Ответ №2", answer_status: false)
  answers.push Answer.create!(question:questions[question_id_counter], content: "Ответ №3", answer_status: false)
  answers.push Answer.create!(question:questions[question_id_counter], content: "Ответ №4", answer_status: true)
end

