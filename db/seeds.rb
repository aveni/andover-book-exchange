# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


include BooksHelper

rb = User.find_by_email('rbrigden@andover.edu')
av = User.find_by_email('avenigalla@andover.edu')
unless rb || av
  av = User.new(first:'Abhinav', last:'Venigalla', email: 'avenigalla@andover.edu', password: 'abhiveni', password_confirmation: 'abhiveni')
  rb = User.new(first:'Ryan', last:'Brigden', email: 'rbrigden@andover.edu', password: 'ryanbrig', password_confirmation: 'ryanbrig')
  rb.roles = %w[superuser admin member]
  av.roles = %w[superuser admin member]
  rb.save
  av.save
end

COURSES = [
	["MATH-595", "Patrick Farrell", "MATH"],
	["COMP-630: Ruby on Rails", "Jacque Hugon", "COMPSCI"],
	["COMP-500", "Maria Litvin", "COMPSCI"],
	["PHYS-550", "Fei Yao", "PHYS"],
	["ENGL-500: A Room of Their Own", "Emma Staffaroni", "ENGL"],
	["MATH-590", "William Scott", "MATH"]
]

BOOKS = [
	['1934356549', [2]],
	['0596002149', [2]],
	['0470088702', [2, 3]],
	['0982477503', [3]],
	['0538497815', [1, 6]],
	['978-0321611116', [4]],
	['007236811X', [4]],
	['1853260827', [5]],
	['0486415864', [5]],
	['0140439447', [5]],
	['0486424537', [5]],
	['0486419207', [5]],
	['0309212960', [1, 2, 3, 4, 6]]
]

LISTINGS = [
	["Buy", 0, 15, "", 1, 1],
	["Buy", 0, 20, "", 1, 1],
	["Buy", 1, 9, "", 1, 1],
	["Buy", 1, 8, "", 1, 1],
	["Buy", 1, 7, "", 1, 1],
	["Buy", 2, 4, "", 1, 1],
	["Buy", 2, 5, "", 1, 1],
	["Buy", 2, 5, "", 1, 1],
	["Buy", 2, 3, "", 1, 1],
	["Buy", 3, 2, "", 1, 1],
	["Buy", 3, 1, "", 1, 1]
]

COURSES.each do |name, teacher, subject|
	Course.create!(name: name, teacher: teacher, subject: subject)
end

BOOKS.each do |isbn, course_ids|
	puts "Adding #{isbn} ..." 
	b = Book.new(isbn: isbn)
	set_book(b)
	b.save!
	course_ids.each do |course_id|
		course = Course.find(course_id)
		course.books << b
	end
	puts "Added #{b.title}."
end

LISTINGS.each do |type, quality, min_price, description, book_id, user_id|
	l = Listing.create!(listing_type: type, quality: quality, min_price: min_price, 
		description: description, book_id: book_id, user_id: user_id, status: true)
	puts "Added listing for #{Book.find(book_id).title}."
end
