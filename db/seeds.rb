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

project1 = Project.create ({  name: "Webseite überarbeiten", description: "Überarbeitung der hauseigenen Webseite",
                             dueDate: "2017-07-30", startDate: "2017-07-10",
                             created_at: "2017-07-15 15:14:52",
                             updated_at: "2017-07-15 16:07:42"})

project2 = Project.create ({  name: "Datenbank wechseln", description: "Wechsel von MySQL zu Postgresql",
                             dueDate: "2017-07-25", startDate: "2017-07-15",
                             created_at: "2017-07-15 15:14:52",
                             updated_at: "2017-07-15 16:07:42"})

project3 = Project.create ({  name: "Einführung Webshop für Meyer GmbH", description: "Einführung eines Webshops auf Basis von Ruby on Rails",
                             dueDate: "2017-08-15", startDate: "2017-07-30",
                             created_at: "2017-07-15 15:14:52",
                             updated_at: "2017-07-15 16:07:42"})

sprint1 = Sprint.create ({name: "Sprint 1", startDate: "2017-07-01",
                          endDate: "2017-07-30", effort: nil, remainingWork: nil, created_at: "2017-07-20 11:34:14",
                          updated_at: "2017-07-20 11:34:14", project_id: 1,
                          retroperspective: nil, sprintreview: nil})

backlockitem1_1 = Backlogitem.create ({   title: "Models überabeiten", description: "Überarbeiten der Datenbanktabellen",
                                          author: "3", creationdate: "2017-07-08",
                                        assignedto: "", state: "Done",
                                        priorty: "Low", effort: 3,
                                        created_at: "2017-07-15 15:34:13", updated_at: "2017-07-25", project_id: 1})

backlockitem1_2 = Backlogitem.create ({   title: "Layout anpassen", description: "Anpassen des Layouts",
                                          author: "3", creationdate: "2017-07-08",
                                        assignedto: "", state: "Done",
                                        priorty: "Low", effort: 2,
                                        created_at: "2017-07-15 15:34:13", updated_at: "2017-07-14", project_id: 1})

backlockitem1_3 = Backlogitem.create ({   title: "Aufräumen des Programmcodes", description: "Schlechte Designpattern entfernen",
                                          author: "3", creationdate: "2017-07-08",
                                        assignedto: "", state: "Done",
                                        priorty: "Low", effort: 3,
                                        created_at: "2017-07-13 15:34:13", updated_at: "2017-07-13", project_id: 1})

task1 = Task.create ({ title: "Kundendatenbank erweitern", description: "Kundentabelle benötigt ein Adresszusatzfeld", author: "3",
                       creationdate: nil, assignedto: "1", state: "Done", priority: "Medium",
                       remainingwork: 3, effort: 3, created_at: "2017-07-20 11:31:23",
                       updated_at: "2017-07-10", backlogitem_id: backlockitem1_1.id, sprint_id: sprint1.id })

task2 = Task.create ({ title: "Adresse in extra Tabelle auslagern", description: "Auslagern der Adresse in eine neue Tabelle und erstellend er Relation",
                       author: "3", creationdate: nil, assignedto: "1", state: "Done", priority: "Medium",
                       remainingwork: 3, effort: 3, created_at: "2017-07-20 11:31:23",
                       updated_at: "2017-07-07", backlogitem_id: 1, sprint_id: 1 })

task3 = Task.create ({ title: "Model anlegen", description: "Datenbanktabelle anlegen", author: "3",
                       creationdate: nil, assignedto: "1", state: "Done", priority: "Medium",
                       remainingwork: 3, effort: 3, created_at: "2017-07-20 11:31:23",
                       updated_at: "2017-07-25", backlogitem_id: 1, sprint_id: 1 })









