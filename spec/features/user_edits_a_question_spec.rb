require 'rails_helper'

feature "User edits a question", %(
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates

  Acceptance Criteria

  [x] I must provide valid information
  [x] I must be presented with errors if I fill out the form incorrectly
  [x] I must be able to get to the edit page from the question details page
) do
  let(:question){FactoryGirl.create(:question)}

  scenario "User gets to the edit page from the question details page" do
    visit question_path(question)
    expect(page).to have_link("Edit", href: edit_question_path(question))
    click_link 'Edit'

    expect(current_path).to eq edit_question_path(question)
  end

  scenario "User provides valid information" do
    new_question_title = 'A new, improved title' * 3

    visit edit_question_path(question)
    fill_in "Title", with: new_question_title
    click_button 'Update Question'

    expect(page).to have_content('Question updated.')
    expect(page).to have_content(new_question_title)
  end

  scenario "User sees error when submitting incorrect information" do
    visit edit_question_path(question)
    fill_in 'Title', with: ''

    click_button 'Update Question'
    expect(page).to have_content("can't be blank")
  end

end
