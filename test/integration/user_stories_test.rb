require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
	LineItem.delete_all
	Order.delete_all
	ruby_book = products(:ruby)
  # test "the truth" do
  #   assert true
  # end
  xml_http_request :post, '/line_items', product_id: ruby_book.id
	assert_response :success

	cart = Cart.find(session[:cart_id])
	assert_equal 1, cart.line_items.size
	assert_equal ruby_book, cart.line_items[0].product

	get "/orders/new"
	assert_response :success
	assert_template "new"

	post_via_redirect "/orders",
	assert_response :success
	assert_template "index"
	cart = Cart.find(session[:cart_id])
	assert_equal 0, cart.line_items.size
end
