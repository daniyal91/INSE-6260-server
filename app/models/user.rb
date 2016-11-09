class User < ActiveRecord::Base
	self.inheritance_column = :role 
 
  # We will need a way to know which childs will subclass the User model
  def self.roles
    %w(Admin Patient Nurse)
  end

  scope :admins, -> { where(role: 'Admin') } 
  scope :patients, -> { where(role: 'Patient') } 
  scope :nurses, -> { where(role: 'Nurse') } 
end
