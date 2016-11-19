class User < ActiveRecord::Base
	self.inheritance_column = :role 

	has_many :api_keys
 
  # We will need a way to know which childs will subclass the User model
  def self.roles
    %w(Admin Patient Nurse)
  end

  scope :admins, -> { where(role: 'Admin') } 
  scope :patients, -> { where(role: 'Patient') } 
  scope :nurses, -> { where(role: 'Nurse') } 

  def session_api_key
    api_keys.active.session.first_or_create
  end
  
end
