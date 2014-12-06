# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "mitsun.chieh@gmail.com", password: "qwerasdf", name: "MitsunChieh")
User.create(email: "12345678@gmail.com", password: "12345678", name: "123")
User.create(email: "ggg@gmail.com", password: "12345678", name: "Holy")
Category.create(name: "Rails")
Category.create(name: "Parse")
Topic.create(name: "How to build a rails forum?", content: "As topic", user_id: 1, reply_counter: 2)
Topic.create(name: "How to build a parse forum?", content: "As topic", user_id: 2, reply_counter: 2)
TopicCategoryship.create(topic: Topic.first, category: Category.first)
TopicCategoryship.create(topic: Topic.last, category: Category.last)
Reply.create(topic_id: 1, content: "11111, Just write down rails hello world!", user_id: 2)
Reply.create(topic_id: 1, content: "22222, Just write down rails hello world!", user_id: 2)
Reply.create(topic_id: 2, content: "11111, Just write down parse hello world!", user_id: 1)
Reply.create(topic_id: 2, content: "22222, Just write down parse hello world!", user_id: 1)