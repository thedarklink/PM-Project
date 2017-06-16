# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[:productowner, :team, :master ].each do |role|
  Role.find_or_create_by(name: role)
end


prod = User.create ({ email: 'product@tool.de', password: "test123",
                      password_confirmation: "test123"})
prod.add_role :productowner

team = User.create ({ email: 'team@tool.de', password: "test123",
                      password_confirmation: "test123"})
team.add_role :team

master = User.create ({ email: 'master@tool.de', password: "test123",
                        password_confirmation: "test123"})
master.add_role :master
