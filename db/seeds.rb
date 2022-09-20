# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@admin = User.create(first_name: 'Ruslan', last_name: 'Faizullin', email: 'fairus200599@gmail.com', password: '123456', type: 'Admin')

@backend = Category.create(title: 'Backend')
@frontend = Category.create(title: 'Frontend')

@test1 = @backend.tests.create(title: 'Ruby', level: 0, user_id: @admin.id)
@test2 = @backend.tests.create(title: 'Rails', level: 2, user_id: @admin.id)
@test3 = @frontend.tests.create(title: 'JavaScript', level: 1, user_id: @admin.id)
@test4 = @frontend.tests.create(title: 'HTML', level: 0, user_id: @admin.id)
@test5 = @frontend.tests.create(title: 'CSS', level: 1, user_id: @admin.id)

@question1 = @test1.questions.create(body: 'Что вернет 2.superclass в версии Ruby 3.0?')
@question2 = @test2.questions.create(body: 'Команда для отката миграций назад и обратно')
@question3 = @test3.questions.create(body: 'Чему равно значение выражения 4 - "5" + 0xf - "1e1"?')
@question4 = @test4.questions.create(body: 'Каким является следующий адрес ссылки: pages/page2.html')
@question5 = @test5.questions.create(body: 'Какое свойство CSS определяет размер текста')

@question1.answers.create(body: 'Fixnum')
@question1.answers.create(body: 'Integer', correct: true)
@question1.answers.create(body: 'String')
@question1.answers.create(body: 'Boolean')
@question2.answers.create(body: 'rails db:rollback')
@question2.answers.create(body: 'rails db:migrate:redo', correct: true)
@question3.answers.create(body: 'Строке')
@question3.answers.create(body: 'Цифре', correct: true)
@question4.answers.create(body: 'Абсолютным')
@question4.answers.create(body: 'Относительным', correct: true)
@question5.answers.create(body: 'text-size')
@question5.answers.create(body: 'font-size', correct: true)
