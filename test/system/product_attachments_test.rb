require "application_system_test_case"

class ProductAttachmentsTest < ApplicationSystemTestCase
  setup do
    @product_attachment = product_attachments(:one)
  end

  test "visiting the index" do
    visit product_attachments_url
    assert_selector "h1", text: "Product attachments"
  end

  test "should create product attachment" do
    visit product_attachments_url
    click_on "New product attachment"

    fill_in "Avatar", with: @product_attachment.avatar
    fill_in "Product", with: @product_attachment.product_id
    click_on "Create Product attachment"

    assert_text "Product attachment was successfully created"
    click_on "Back"
  end

  test "should update Product attachment" do
    visit product_attachment_url(@product_attachment)
    click_on "Edit this product attachment", match: :first

    fill_in "Avatar", with: @product_attachment.avatar
    fill_in "Product", with: @product_attachment.product_id
    click_on "Update Product attachment"

    assert_text "Product attachment was successfully updated"
    click_on "Back"
  end

  test "should destroy Product attachment" do
    visit product_attachment_url(@product_attachment)
    click_on "Destroy this product attachment", match: :first

    assert_text "Product attachment was successfully destroyed"
  end
end
