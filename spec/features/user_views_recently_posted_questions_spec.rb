require 'rails_helper'

feature "User views recently posted questions", %(
  As a user
  I want to view recently posted questions
  So that I can help others
  Acceptance Criteria
  [x] I must see the title of each question
  [x] I must see questions listed in order, most recently posted first
) do

  scenario "User sees the title of each question" do
    question = FactoryGirl.create(:question)
    visit questions_path

    expect(page).to have_content(question.title)
  end

  scenario "User sees questions listed in order, most recent question first" do
    question = FactoryGirl.create(:question)
    another_question = FactoryGirl.create(:question)
    visit questions_path

    expect(page.body.index(another_question.title)).to be < page.body.index(question.title)
  end

end
