require 'forgery'

namespace :utils do

	task(:create_random_users => :environment) do
		300.times do |n|
			user = User.new
			user.first = Forgery('name').first_name
			user.last = Forgery('name').last_name
			user.email = user.first.downcase[0] + user.last.downcase + "@" + Forgery('internet').domain_name
			
			password_length = (8..16).to_a.shuffle.first
			password = Devise.friendly_token.first(password_length)
			user.password = password


		# user.roles = %w[member]
			if user.save
				puts "... created account for #{user.first} #{user.last} #{user.email}"
			else
				puts "... could not create account for #{user.email}"
			# 		user.errors.full
			end

		end
	end

end