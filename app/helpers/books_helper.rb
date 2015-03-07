module BooksHelper

	def get_book(isbn)
		return nil if isbn.empty?
		isbn = isbn.gsub '-', ''
		isbn = isbn.gsub ' ', ''
		isbn = ISBN.thirteen(isbn) if isbn.length == 10

		url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}"
		res = JSON.parse open(url).read

		if res['totalItems'] == 0 
			nil
		else
			info = res['items'].first['volumeInfo']
			title = info['title']
			if info['authors']
				authors_text = info['authors'].join(", ")
			else 
				authors_text = "No Author"
			end
			{"title" => title, "authors_text" => authors_text, "isbn" => isbn}
		end
	end

	def set_book(book)
		book_hash = get_book(book.isbn)
		if (book_hash)
			book.isbn = book_hash["isbn"]
      		book.title = title_upcase(book_hash["title"])
      		book.author = book_hash["authors_text"]
      	else
      		book.title = nil
      		book.author = nil
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
