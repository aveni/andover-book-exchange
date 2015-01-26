module BooksHelper



	def get_book(isbn)
		ISBNdb::Query.find_book_by_isbn(isbn).first
	end

end
