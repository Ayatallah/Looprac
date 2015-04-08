# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#First Batch
Landmark.create(name: 'Giza', latitude: 100, longitude: 200, description: "First Land")
#

# Second Batch
Landmark.create(name: 'City Stars', latitude: 100, longitude: 200, description: "Land")
Landmark.create(name: 'Liverpool', latitude: 100, longitude: 200, description: "Land")
Landmark.create(name: 'GUC', latitude: 100, longitude: 200, description: "Land")
Landmark.create(name: 'AUC', latitude: 100, longitude: 200, description: "Land")
Landmark.create(name: 'Sherook', latitude: 100, longitude: 200, description: "Land")
Ride.create(user_id: 1, source_id: 1, destination_id: 2, seatNum: 4, description: "Hi")
Ride.create(user_id: 1, source_id: 1, destination_id: 3, seatNum: 4, description: "Hi")
Ride.create(user_id: 1, source_id: 2, destination_id: 3, seatNum: 4, description: "Hi")
Ride.create(user_id: 1, source_id: 3, destination_id: 1, seatNum: 4, description: "Hi")
Ride.create(user_id: 1, source_id: 4, destination_id: 5, seatNum: 4, description: "Hi")
Ride.create(user_id: 1, source_id: 4, destination_id: 3, seatNum: 4, description: "Hi")
#
