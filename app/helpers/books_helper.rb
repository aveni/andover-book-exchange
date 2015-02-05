module BooksHelper

	def get_book(isbn)
		if (isbn != '')
			ISBNdb::Query.find_book_by_isbn(isbn).first
		end
	end

	def set_book(book, isbn)
		book_hash = get_book(isbn)
		if (book_hash)
      		book.title = title_upcase(book_hash.title)
      		book.author = strip_comma(book_hash.authors_text)
      	end
    	end

	def truncate(text, options = {}, &block)
	   	if text
	  	length  = options.fetch(:length, 30)

	   	content = text.truncate(length, options)
	   	content = options[:escape] == false ? content.html_safe : ERB::Util.html_escape(content)
	    	content << capture(&block) if block_given? && text.length > length
	   	content
	  	end
	end

	def strip_comma(str)
		comma=','
   		new_str = ""
  		str.each_byte do |byte|
      		new_str << byte.chr unless byte.chr == comma
  	 	end
  	 	new_str
	end

	def title_upcase(ttl)
		ttl.split.map(&:capitalize).join(' ')
	end
end
