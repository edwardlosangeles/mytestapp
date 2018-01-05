class Product < ApplicationRecord
	has_many :orders

	# comment model
	has_many :comments

	# validation
	validates :name, presence: true

	def self.search(search_term)
		if Rails.env.development?
			Product.where("name LIKE ?", "%#{search_term}%")
		else
			Product.where("name ilike ?", "%#{search_term}%")
		end
	end

	# comment model
	def highest_rating_comment
		comments.rating_desc.first
	end

	# raty
	def average_rating
		comments.average(:rating).to_f
	end

end
