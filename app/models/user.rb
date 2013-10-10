class User < ActiveRecord::Base
	has_many :invoices
	validates	:nome, presence: true, length: { maximum: 50 }
	validates	:cognome, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates	:email, presence: true	, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
	before_save { self.email = email.downcase }
	before_create :create_remember_token

	has_secure_password
	validates :password, length: { minimum: 8 }

	def User.new_remember_token
    	SecureRandom.urlsafe_base64
  	end


  	def User.encrypt(token)
    	Digest::SHA1.hexdigest(token.to_s)
  	end

  	def feed
    # This is preliminary. See "Following users" for the full implementation.
    Invoice.where("user_id = ?", id)
  	end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
