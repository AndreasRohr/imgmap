require "test_helper"

class ImageSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_set = image_sets(:one)
  end

  test "should get index" do
    get image_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_image_set_url
    assert_response :success
  end

  test "should create image_set" do
    assert_difference("ImageSet.count") do
      post image_sets_url, params: { image_set: { color: @image_set.color, map_id: @image_set.map_id, title: @image_set.title, typ: @image_set.typ } }
    end

    assert_redirected_to image_set_url(ImageSet.last)
  end

  test "should show image_set" do
    get image_set_url(@image_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_set_url(@image_set)
    assert_response :success
  end

  test "should update image_set" do
    patch image_set_url(@image_set), params: { image_set: { color: @image_set.color, map_id: @image_set.map_id, title: @image_set.title, typ: @image_set.typ } }
    assert_redirected_to image_set_url(@image_set)
  end

  test "should destroy image_set" do
    assert_difference("ImageSet.count", -1) do
      delete image_set_url(@image_set)
    end

    assert_redirected_to image_sets_url
  end
end
