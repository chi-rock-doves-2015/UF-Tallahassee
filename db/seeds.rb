# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role = ["researcher", "faculty"]

5.times { User.create!(name: Faker::Name.name, email: Faker::Internet.user_name + "@uft.edu", password: "password", role: role.sample) }

5.times { Proposal.create!(title: Faker::Name.title, hypothesis: Faker::Lorem.paragraph, background: Faker::Lorem.paragraph, faculty_id: (1..5)) }

5.times { Experiment.create!(title: Faker::Name.title, methodology: Faker::Lorem.paragraph, observations: Faker::Lorem.paragraph, conclusion: Faker::Lorem.paragraph, researcher_id: (1..5), proposal_id: (1..5)) }

5.times { Comment.create!(body: Faker::Lorem.sentence, author_id: (1..5), commentable_id: (1..5)) }