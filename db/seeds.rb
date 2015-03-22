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
  rb.roles = %w[superuser]
  av.roles = %w[admin]
  rb.save
  av.save
end

def find_subj(name)
	if name[0..2] == "ART"
		"ART"
	else
		name[0..3]
	end
end

# COURSES = [
# 	["MATH-595", "Patrick Farrell"],
# 	["COMP-630: Ruby on Rails", "Jacques Hugon"],
# 	["COMP-500", "Maria Litvin"],
# 	["PHYS-550", "Fei Yao"],
# 	["ENGL-500: Writers in Depth", "Mary Fulton"],
# 	["ENGL-535AA/2-01: James Joyce", "Kevin O'Conner"],
# 	["HIST-SS520", "Elizabeth Monroe"],
# 	["HIST-300", "Kathleen Dalton"],
# 	["FREN-120", "Elizabeth Poland"],
# 	["CHIN-120", "Lixia Ma"],
# 	["SPAN-120", "John Maier"],
# 	["ART-401", "Anthony Lawson"],
# 	["MUSC-225", "Peter Lorenco"],
# 	["MISCELLANEOUS", "None"]
# ]

# BOOKS = [
# 	['1934356549', [2]],
# 	['0596002149', [2]],
# 	['978-0470108543', [2, 3]],
# 	['0982477503', [3]],
# 	['0538497815', [1]],
# 	['978-0321611116', [4]],
# 	['007236811X', [4]],
# 	['1853260827', [5]],
# 	['0486415864', [5]],
# 	['0140439447', [5]],
# 	['1494405490', [6]],
# 	['0486268705', [6]],
# 	['1429283432', [7]],
# 	['0452288444', [7]],
# 	['014303720X', [8]],
# 	['0073386448', [9]],
# 	['0804842353', [10]],
# 	['0764141104', [11]],
# 	['0810995123', [12]],
# 	['1938073533', [13]],
# 	['160774743X', [14]]
# ]

# LISTINGS = [
# 	["Buy", 0, 15, "", 1, 2],
# 	["Buy", 0, 20, "", 1, 2],
# 	["Buy", 1, 9, "", 1, 2],
# 	["Buy", 1, 8, "", 1, 2],
# 	["Buy", 1, 7, "", 1, 2],
# 	["Buy", 2, 4, "", 1, 2],
# 	["Buy", 2, 5, "", 1, 2],
# 	["Buy", 2, 5, "", 1, 2],
# 	["Buy", 2, 3, "", 1, 2],
# 	["Buy", 3, 2, "", 1, 2],
# 	["Buy", 3, 1, "", 1, 2]
# ]


str = File.read("#{Rails.public_path}/courses.txt")
COURSES = str.split("\n")

COURSES.each do |c|
	arr = c.split("/")
	name = arr[0]
	if arr[1]
		teacher_text = arr[1]
	else
		teacher_text = "No Teacher"
	end
	Course.create!(name: name, teacher: teacher_text, subject: find_subj(name))
	puts "Added #{name}"
end

str = File.read("#{Rails.public_path}/books.txt")
BOOKS = str.split("\n")

BOOKS.each do |b|
	arr = b.split("/")
	isbn = arr[0]
	courses = arr[1].split(",")
	b = Book.new(isbn: isbn)
	set_book(b)
	b.save!
	courses.each do |name|
		course = Course.where(name: name).first
		course.books << b
	end
	puts "Added #{b.title}"
end

# BOOKS.each do |isbn, course_ids|
# 	puts "Adding #{isbn} ..." 
# 	b = Book.new(isbn: isbn)
# 	set_book(b)
# 	b.save!
# 	course_ids.each do |course_id|
# 		course = Course.find(course_id)
# 		course.books << b
# 	end
# 	puts "Added #{b.title}."
# end

# LISTINGS.each do |type, quality, min_price, description, book_id, user_id, statusp|
# 	l = Listing.create!(listing_type: type, quality: quality, min_price: min_price, 
# 		description: description, book_id: book_id, user_id: user_id, status: true)
# 	puts "Added listing for #{Book.find(book_id).title}."
# end
