module BooksHelper

	def searchISBN(isbn)
		return ISBNdb::Query.find_book_by_isbn(isbn)
	end

end
