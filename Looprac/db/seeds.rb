# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Todo.create!(title: 'shopping', notes: 'tomato, tomato, tomato')
#Todo.create!(title: 'steal the bike')
#Todo.create!(title: 'Get to Diamond1', notes: 'pick orianna -> win')
#Todo.create!(title: 'google maps api', notes: 'you have to')
#Todo.create!(title: 'JS!', notes: 'just do it')

Ride.create(user_id: 2, source_id: 1, destination_id: 2, seatNum: 4, description: "Every day")
Ride.create(user_id: 1, source_id: 3, destination_id: 1, seatNum: 2, description: "hmm")

Ride.create(user_id: 3, source_id: 2, destination_id: 1, seatNum: 4, description: "Every day")
Ride.create(user_id: 3, source_id: 3, destination_id: 2, seatNum: 2, description: "hmm")

Request.create(offerer_id: 2, ride_id: 2, requester_id: 1)

