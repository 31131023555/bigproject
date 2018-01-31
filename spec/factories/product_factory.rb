FactoryBot.define do
	factory :product do
		title 'Amazon Lily'
		price 9.99
		imgurl 'http://wa.co'
		description 'AL is a supergirl!'
		category_id { Category.last.id }
	end
end