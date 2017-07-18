class Product < ApplicationRecord
	has_many :orders
	has_many :comments
	validates :name, presence: true
	def highest_rating_comment
  		comments.rating_desc.first
	end
	def average_rating
  		comments.average(:rating).to_f
	end
end
