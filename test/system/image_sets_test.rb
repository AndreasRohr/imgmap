require "application_system_test_case"

class ImageSetsTest < ApplicationSystemTestCase
  setup do
    @image_set = image_sets(:one)
  end

  test "visiting the index" do
    visit image_sets_url
    assert_selector "h1", text: "Image sets"
  end

  test "should create image set" do
    visit image_sets_url
    click_on "New image set"

    fill_in "Color", with: @image_set.color
    fill_in "Map", with: @image_set.map_id
    fill_in "Title", with: @image_set.title
    fill_in "Typ", with: @image_set.typ
    click_on "Create Image set"

    assert_text "Image set was successfully created"
    click_on "Back"
  end

  test "should update Image set" do
    visit image_set_url(@image_set)
    click_on "Edit this image set", match: :first

    fill_in "Color", with: @image_set.color
    fill_in "Map", with: @image_set.map_id
    fill_in "Title", with: @image_set.title
    fill_in "Typ", with: @image_set.typ
    click_on "Update Image set"

    assert_text "Image set was successfully updated"
    click_on "Back"
  end

  test "should destroy Image set" do
    visit image_set_url(@image_set)
    click_on "Destroy this image set", match: :first

    assert_text "Image set was successfully destroyed"
  end
end
