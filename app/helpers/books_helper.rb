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
      		book.author = fixcomma(book_hash.authors_text)
      	end
    end

    def fixcomma(str)
		if str[-1] == ","
			str[0..-2]
		elsif str[-2..-1] == ", "
			str[0..-3]
		else
			str
		end
	end

	def strip(str, strip)
		unless str==nil
	   		new_str = ""
	  		str.each_byte do |byte|
	      		new_str << byte.chr unless byte.chr == strip
	  	 	end
	  	 	new_str
	  	 else
	  	 	""
	  	 end
	end

	def title_upcase(ttl)
		ttl.split.map(&:capitalize).join(' ')
	end

	def format(i)
		strip(i, '-')
	end
		
	def rand_spacing(range)
		nums = Array.new(7)
		elem = rand(range)
		for i in [0..7] do
			if elem != nums[i]
				nums.push(elem)
			end
		end
		return nums
	end


end
