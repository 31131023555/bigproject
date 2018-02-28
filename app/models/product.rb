require 'htmlentities'

class Product < ApplicationRecord
	belongs_to :category, optional: true	
	has_many :order_items
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true, numericality: { greater_than: 0 }
	validates :imgurl, presence: true
	validate :title_is_shorter_than_description
	before_validation :decode_html_entities
	before_validation :strip_html
	
	def decode_html_entities
		self.title = HTMLEntities.new.decode self.title
		self.description = HTMLEntities.new.decode self.description
	end

	def strip_html
		self.title = ActionView::Base.full_sanitizer.sanitize(
			self.title)
		self.description = ActionView::Base.full_sanitizer.sanitize(
			self.description)
	end

	def title_is_shorter_than_description
		return if title.blank? or description.blank?
		if description.length < title.length
			errors.add(:title, 'Title must be shorter than description')
		end
	end
end