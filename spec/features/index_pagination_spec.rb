# frozen_string_literal: true

RSpec.feature "User pages through a list of documents" do
  scenario "User pages through a list of documents" do
    given_there_are_lots_of_documents
    when_i_visit_the_index_page
    then_i_should_see_the_first_results
    when_i_click_to_see_the_next_results
    then_i_should_see_the_next_results
    when_i_click_to_see_previous_results
    then_i_should_see_the_first_results
  end

  def given_there_are_lots_of_documents
    create_list(:document, 51)
  end

  def when_i_visit_the_index_page
    visit documents_path
  end

  def then_i_should_see_the_first_results
    expect(all(".gem-c-document-list__item").count).to eq 50
    expect(page).to have_content I18n.t("documents.index.search_results.page_info", page: 1, pages: 2)
    expect(page).to_not have_content("Previous page")
  end

  def when_i_click_to_see_the_next_results
    click_on "Next page"
  end

  def when_i_click_to_see_previous_results
    click_on "Previous page"
  end

  def then_i_should_see_the_next_results
    expect(all(".gem-c-document-list__item").count).to eq 1
    expect(page).to have_content I18n.t("documents.index.search_results.page_info", page: 2, pages: 2)
    expect(page).to_not have_content("Next page")
  end
end
