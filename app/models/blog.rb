class Blog < ActiveRecord::Base
	has_many :pictures
	belongs_to :user
end
