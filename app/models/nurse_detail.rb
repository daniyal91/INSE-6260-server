class NurseDetail < ActiveRecord::Base
	belongs_to :nurse
	belongs_to :service
end
