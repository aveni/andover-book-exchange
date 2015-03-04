module BooksHelper

	def get_book(isbn)
		return nil if isbn.empty?

		url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}"
		res = JSON.parse open(url).read

		if res['totalItems'] == 0 
			nil
		else
			info = res['items'].first['volumeInfo']
			title = info['title']
			authors = info['authors'].join(", ")
			{"title" => title, "authors_text" => authors, "isbn" => isbn}
		end
	end

	def set_book(book)
		isbn = book.isbn.gsub '-', ''
		book_hash = get_book(isbn)
		if (book_hash)
			book.isbn = isbn
      		book.title = title_upcase(book_hash["title"])
      		book.author = fixcomma(book_hash["authors_text"])
      	else
      		book.title = nil
      		book.author = nil
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


	def title_upcase(ttl)
		ttl.split.map(&:capitalize).join(' ')
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
