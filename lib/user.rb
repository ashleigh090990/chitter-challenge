require 'bcrypt'

class User

	include DataMapper::Resource

	attr_reader :password

	property :id, Serial
  property :email, String, unique: true
  property :encrypted_password, Text

#   validates_confirmation_of :password

  def password=(password)
  	@password = password
  	self.encrypted_password = BCrypt::Password.create(password) #encrypts the user's password
  end

end