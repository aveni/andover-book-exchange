class Notification < ActiveRecord::Base
	validates :message, presence: true
end
