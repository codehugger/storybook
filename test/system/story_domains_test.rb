require "application_system_test_case"

class StoryDomainsTest < ApplicationSystemTestCase
  setup do
    @story_domain = story_domains(:one)
  end

  test "visiting the index" do
    visit story_domains_url
    assert_selector "h1", text: "Story Domains"
  end

  test "creating a Story domain" do
    visit story_domains_url
    click_on "New Story Domain"

    fill_in "Name", with: @story_domain.name
    click_on "Create Story domain"

    assert_text "Story domain was successfully created"
    click_on "Back"
  end

  test "updating a Story domain" do
    visit story_domains_url
    click_on "Edit", match: :first

    fill_in "Name", with: @story_domain.name
    click_on "Update Story domain"

    assert_text "Story domain was successfully updated"
    click_on "Back"
  end

  test "destroying a Story domain" do
    visit story_domains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Story domain was successfully destroyed"
  end
end
