require 'rails_helper'

feature "User views question details", %(
  As a user
  I want to view a question's details
  So that I can effectively understand the question
  Acceptance Criteria
  [x] I must be able to get to this page from the questions index
  [x] I must see the question's title
  [x] I must see the question's description
  ) do


  scenario "User must be able to get to this page from the questions index" do
    question = FactoryGirl.create(:special_question)
    visit questions_path
    click_link question.title

    expect(current_path).to eq question_path(question)
  end

  scenario "User must see the question's title" do
    question = FactoryGirl.create(:question)
    visit question_path(question)

    expect(page).to have_content question.title
  end

  scenario "User must see the question's description" do
    question = FactoryGirl.create(:question)
    visit question_path(question)

    expect(page).to have_content question.description
  end

end
