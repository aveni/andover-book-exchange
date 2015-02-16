# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# abhi = User.new
# abhi.first = 'Abhinav'
# abhi.last = 'Venigalla'
# abhi.email = 'avenigalla@andover.edu'
# abhi.password = 'abhiveni'
# abhi.password_confirmation = 'abhiveni'
# abhi.save!

include BooksHelper

c1 = Course.create!(name: "MATH-595", teacher: "Patrick Farrell", subject: "MATH")
c2 = Course.create!(name: "COMP-630: Ruby on Rails", teacher: "Jacque Hugon", subject: "COMPSCI")

b1 = Book.new(isbn: '1934356549')
set_book(b1)
b1.save!
c2.books << b1