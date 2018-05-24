require 'test_helper'

class MobileNumberStorersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mobile_number_storer = mobile_number_storers(:one)
  end

  test "should get index" do
    get mobile_number_storers_url
    assert_response :success
  end

  test "should get new" do
    get new_mobile_number_storer_url
    assert_response :success
  end

  test "should create mobile_number_storer" do
    assert_difference('MobileNumberStorer.count') do
      post mobile_number_storers_url, params: { mobile_number_storer: { mobile_number: @mobile_number_storer.mobile_number } }
    end

    assert_redirected_to mobile_number_storer_url(MobileNumberStorer.last)
  end

  test "should show mobile_number_storer" do
    get mobile_number_storer_url(@mobile_number_storer)
    assert_response :success
  end

  test "should get edit" do
    get edit_mobile_number_storer_url(@mobile_number_storer)
    assert_response :success
  end

  test "should update mobile_number_storer" do
    patch mobile_number_storer_url(@mobile_number_storer), params: { mobile_number_storer: { mobile_number: @mobile_number_storer.mobile_number } }
    assert_redirected_to mobile_number_storer_url(@mobile_number_storer)
  end

  test "should destroy mobile_number_storer" do
    assert_difference('MobileNumberStorer.count', -1) do
      delete mobile_number_storer_url(@mobile_number_storer)
    end

    assert_redirected_to mobile_number_storers_url
  end
end
