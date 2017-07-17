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


project = Project.create ({  name: "Projekt 1", description: "Projekt 1 Beschreibung",
                             dueDate: "2017-07-18", startDate: "2017-07-10",
                             created_at: "2017-07-15 15:14:52",
                             updated_at: "2017-07-15 16:07:42", sprint_id: nil})

backlockitem1 = Backlogitem.create ({   title: "Test 1", description: "1", author: "3", creationdate: "2017-07-15",
                              assignedto: "", state: "New",
                              priorty: "Low", effort: 1,
                              created_at: "2017-07-15 15:34:13", updated_at: "2017-07-12", project_id: 1})

backlockitem2 = Backlogitem.create ({   title: "Test 2", description: "2", author: "3", creationdate: "2017-07-15",
                                        assignedto: "", state: "Done",
                                        priorty: "Low", effort: 2,
                                        created_at: "2017-07-15 15:34:13", updated_at: "2017-07-14", project_id: 1})

backlockitem3 = Backlogitem.create ({   title: "Test 2", description: "2", author: "3", creationdate: "2017-07-15",
                                        assignedto: "", state: "Done",
                                        priorty: "Low", effort: 3,
                                        created_at: "2017-07-13 15:34:13", updated_at: "2017-07-13", project_id: 1})