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
		Book.create(isbn:i)
	end
end




	
