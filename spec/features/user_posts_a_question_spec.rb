require 'rails_helper'

feature "User views question details", %(
  As a user
  I want to post a question
  So that I can receive help from others

  Acceptance Criteria

  [x] I must provide a title that is at least 40 characters long
  [x] I must provide a description that is at least 150 characters long
  [x] I must be presented with errors if I fill out the form incorrectly
  ) do


  scenario "User posts a question" do
    question_title = "abcdefghijklmnopqrstuvwxyz" * 2
    question_description = "abcdefghijklmnopqrstuvwxyz" * 6
    visit new_question_path
    fill_in 'Title', with: question_title
    fill_in 'Description', with: question_description

    click_button 'Add Question'

    expect(page).to have_content('Question added.')
    expect(page).to have_content(question_title)
  end

  scenario "puts title that is less than 40 characters long" do
    question_title = "abcdefghijklmnopqrstuvwxyz"
    question_description = "abcdefghijklmnopqrstuvwxyz" * 6
    visit new_question_path
    fill_in 'Title', with: question_title
    fill_in 'Description', with: question_description

    click_button 'Add Question'

    expect(page).to have_content('Title is too short (minimum is 40 characters)')
  end

  scenario "puts description that is less than 150 characters long" do
    question_title = "abcdefghijklmnopqrstuvwxyz" * 2
    question_description = "abcdefghijklmnopqrstuvwxyz"
    visit new_question_path
    fill_in 'Title', with: question_title
    fill_in 'Description', with: question_description

    click_button 'Add Question'

    expect(page).to have_content('Description is too short (minimum is 150 characters)')
  end

  scenario 'attempt to add an empty question' do
    visit new_question_path

    click_button 'Add Question'

    expect(page).to have_content("can't be blank")
  end

end
