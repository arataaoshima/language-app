require "application_system_test_case"

class SlidesTest < ApplicationSystemTestCase
  setup do
    @slide = slides(:one)
  end

  test "visiting the index" do
    visit slides_url
    assert_selector "h1", text: "Slides"
  end

  test "creating a Slide" do
    visit slides_url
    click_on "New Slide"

    fill_in "Document", with: @slide.document_id
    fill_in "Image", with: @slide.image
    fill_in "Integer", with: @slide.integer
    fill_in "Order", with: @slide.order
    click_on "Create Slide"

    assert_text "Slide was successfully created"
    click_on "Back"
  end

  test "updating a Slide" do
    visit slides_url
    click_on "Edit", match: :first

    fill_in "Document", with: @slide.document_id
    fill_in "Image", with: @slide.image
    fill_in "Integer", with: @slide.integer
    fill_in "Order", with: @slide.order
    click_on "Update Slide"

    assert_text "Slide was successfully updated"
    click_on "Back"
  end

  test "destroying a Slide" do
    visit slides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Slide was successfully destroyed"
  end
end
