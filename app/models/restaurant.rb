class Restaurant < ActiveRecord::Base
	has_many :blogs
	has_many :addresses
	has_many :pictures
end
