class Service < ActiveRecord::Base
	has_many :requests
	has_many :nurse_details
end
