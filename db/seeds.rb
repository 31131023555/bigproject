categories_list = [
  'Books', 'Toys', 'Luggage', 'Wireless', 'KindleStore', 
  'Appliances', 'VideoGames', 'Electronics', 'Tools', 'Baby'
]

categories_list.each do |cat|
  Category.create(title: cat)

  category = Category.find_by_title(cat)
  res = Amazon::Ecs.item_search('apple', {
    :response_group => 'EditorialReview,Images,ItemAttributes,ItemIds,Offers',
    :search_index => cat})
  res.items.each do |item|
    item_attributes = item.get_element('ItemAttributes')
    Product.create(
        title: item_attributes.get('Title'),
        price: Random.new.rand(1.00..100.00),
        imgurl: item.get_hash('SmallImage')['URL'],
        description: item.get_element('EditorialReview').get('Content'),
        category_id: category.id
    )
  end
end