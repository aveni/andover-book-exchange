require 'test_helper'

class OfferControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get _form" do
    get :_form
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
