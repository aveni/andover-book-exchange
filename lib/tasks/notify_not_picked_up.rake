task :notify_not_picked_up => :environment do

	Exchange.where(delivered:true, library_exchange: true, picked_up:false).each do |exchange|
		if (Time.now - exchange.updated_at) > (7 * 24 * 60 * 60)
			Mailrobot.notify_late_pickup_library(exchange).deliver
			Mailrobot.notify_late_pickup_buyer(exchange).deliver
		end
	end

end