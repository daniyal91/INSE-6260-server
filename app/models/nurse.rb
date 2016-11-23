class Nurse < User
	has_many :nurse_availabilities
	has_many :nurse_details
end