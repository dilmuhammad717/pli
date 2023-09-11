# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
person = Person.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  nickname: Faker::Name.name,
  email: Faker::Internet.free_email,
  phone: '555-111-5555',
  street: 'street 1',
  city: 'Lahore',
  state: 'Punjab',
  zip: '5400'
)
employment1 = person.employments.create!(
  employer: Faker::Name.name,
  date_started: Date.today - 6.month,
  date_ended: Date.today
)
employment2 = person.employments.create!(
  employer: Faker::Name.name,
  date_started: Date.today - 1.year,
  date_ended: Date.today - 6.month
)
