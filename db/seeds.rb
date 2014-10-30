# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "mitsun.chieh@gmail.com", password: "qwerasdf")
User.create(email: "12345678@gmail.com", password: "12345678")
Category.create(name: "Rails")
Category.create(name: "Parse")
Topic.create(name: "How to build a rails forum?", content: "As topic", user_id: 1, category_id: 1)
Topic.create(name: "How to build a parse forum?", content: "As topic", user_id: 2, category_id: 2)
Reply.create(topic_id: 1, content: "Just write down rails hello world!", user_id: 2)
Reply.create(topic_id: 2, content: "Just write down parse hello world!", user_id: 1)
@u = User.all
@u.each do |u|
  u.name = u.email.split("@").first
  u.save
end