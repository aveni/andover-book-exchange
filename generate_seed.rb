def isbn10(isbndash)
	isbndash.split("-").join
end

def isbnGen(num)
	isbns = Array.new
	num.times do
		isbns.push(isbn10(Faker::Code.isbn))
	end
	return isbns
end

def createBooks(num)
	isbns = isbnGen(num)
	seeds = Array.new
	isbns.each do |i|
<<<<<<< HEAD
			Book.create(isbn:i)
=======
		Book.create(isbn:i)
>>>>>>> bc0a09bfd290e04613c7f8e8f47ab421f13e7024
	end
end




	
