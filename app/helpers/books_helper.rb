module BooksHelper

	def get_book(isbn)
		if (isbn != '')
			ISBNdb::Query.find_book_by_isbn(isbn.to_str).first
		end
	end

	def set_book(book)
		book.isbn = strip(book.isbn, '-')
		book_hash = get_book(book.isbn)
		if (book_hash)
      		book.title = title_upcase(book_hash.title)
      		book.author = book_hash.authors_text
      	end
    end

	def strip(str, strip)
   		new_str = ""
  		str.each_byte do |byte|
      		new_str << byte.chr unless byte.chr == strip
  	 	end
  	 	new_str
	end

	def title_upcase(ttl)
		ttl.split.map(&:capitalize).join(' ')
	end

	def format(i)
		strip(i, '-')
	end
		


end
