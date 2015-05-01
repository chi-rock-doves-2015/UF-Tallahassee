# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Proposal.destroy_all
Experiment.destroy_all
Comment.destroy_all

commentables = ["Proposal", "Comment", "Experiment" ]

11.times { User.create!(name: Faker::Name.name, email: Faker::Internet.user_name + "@uft.edu", password: "password", role: rand(0..1)) }

120.times { Proposal.create!(title: Faker::Company.catch_phrase, hypothesis: Faker::Lorem.paragraph, background: Faker::Lorem.paragraph, faculty_id: rand(1..10)) }

300.times { Experiment.create!(title: Faker::Company.bs, summary: Faker::Lorem.paragraph, status: "pending", conclusion: Faker::Lorem.paragraph, researcher_id: rand(1..10), proposal_id: rand(1..10)) }

500.times { Comment.create!(body: Faker::Lorem.sentence, author_id: rand(1..10), commentable_id: rand(1..10), commentable_type: commentables.sample) }



