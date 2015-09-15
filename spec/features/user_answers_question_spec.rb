require 'rails_helper'

feature "User answers a question", %(
  As a user
  I want to answer another user's question
  So that I can help them solve their problem

  Acceptance Criteria

  [x] I must be on the question detail page
  [x] I must provide a description that is at least 50 characters long
  [x] I must be presented with errors if I fill out the form incorrectly
  ) do

  scenario "User must be on the question detail page" do
    question = FactoryGirl.create(:question)
    visit question_path(question)

    expect(page).to have_field('answer_description')
  end

  scenario "User provides description that is at least 50 characters long" do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    answer_description = "abcdefghijklmnopqrstuvwxyz" * 2
    fill_in 'answer_description', with: answer_description
    click_button 'Add Answer'

    expect(page).to have_content('Answer added.')
  end

  scenario "User provides description that is less than 50 characters long" do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    answer_description = "abcdefghijklmnopqrstuvwxyz"
    fill_in 'answer_description', with: answer_description
    click_button 'Add Answer'

    expect(page).to have_content('Description is too short (minimum is 50 characters)')
  end

  scenario "User fills out the form incorrectly" do
    question = FactoryGirl.create(:question)
    visit question_path(question)
    click_button 'Add Answer'

    expect(page).to have_content("can't be blank")
  end

end
