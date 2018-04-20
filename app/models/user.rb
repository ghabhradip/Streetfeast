class User < ActiveRecord::Base
  has_many :blogs
  has_one :picture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :invitable,:omniauthable, omniauth_providers: [:google_oauth2]
    def self.from_omniauth(access_token)
	    data = access_token.info
	    user = User.where(email: data['email']).first
	    user
	end
end
