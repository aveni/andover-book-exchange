# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


include BooksHelper

abhi = User.create!(first:'Abhinav', last:'Venigalla', email: 'avenigalla@andover.edu', password: 'abhiveni', password_confirmation: 'abhiveni')

c1 = Course.create!(name: "MATH-595", teacher: "Patrick Farrell", subject: "MATH")
c2 = Course.create!(name: "COMP-630: Ruby on Rails", teacher: "Jacque Hugon", subject: "COMPSCI")
c3 = Course.create(name:"COMP-500", teacher:"Maria Litvin", subject:"COMPSCI")
c4 = Course.create(name:"PHYS-550", teacher:"Fei Yao", subject:"PHYS")
c5 = Course.create(name:"ENGL-500: A Room of Their Own", teacher:"Emma Staffaroni", subject:"ENGL")

b1 = Book.new(isbn: '1934356549')
set_book(b1)
b1.save!
c2.books << b1
