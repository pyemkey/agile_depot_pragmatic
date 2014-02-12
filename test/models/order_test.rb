require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "requires item in cart" do
  	get :new
  	assert_redirected_to store_path
  	assert_equal flash[:notice], 'Your cart is empty'
  end

  test "should get new" do
  	item = LineItem.new
  	item.build_cart
  	item.product = product(:ruby)
  	item.save!
  	session[:cart_id] = item.cart.id
  	get :new
  	assert_response :success
  end
end
