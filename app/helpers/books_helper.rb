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
			if info['imageLinks'] && info['imageLinks']['thumbnail']
				image = info['imageLinks']['thumbnail']
			else
				image = "book2.png"
			end

			{"title" => title, "authors_text" => authors_text, "isbn" => isbn, "image" => image}
		end
	end

	def set_book(book)
		book_hash = get_book(book.isbn)
		if (book_hash)
			book.isbn = book_hash["isbn"]
      		book.title = title_upcase(book_hash["title"])
      		book.author = book_hash["authors_text"]
      		book.image_url = book_hash["image"]
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

	def avg_prices(book)
		newprice = 0
		likenewprice = 0
		goodprice = 0
		acceptprice = 0

		news = book.listings.where(quality: "0")
		likenews = book.listings.where(quality: "1")
		goods = book.listings.where(quality: "2")
		accepts = book.listings.where(quality: "3")

		news.each do |l|
			newprice += l.min_price/news.size
		end
		likenews.each do |l|
			likenewprice += l.min_price/likenews.size
		end
		goods.each do |l|
			goodprice += l.min_price/goods.size
		end
		accepts.each do |l|
			acceptprice += l.min_price/accepts.size
		end

		[news.size > 0? newprice : nil, likenews.size > 0? likenewprice : nil,
		 goods.size >0? goodprice : nil, accepts.size >0? acceptprice : nil]
	end

	def show_cover(book, width, height)
		image_tag(book.image_url, width: width, height: height)
	end

end
