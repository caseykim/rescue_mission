require 'rails_helper'

feature "User answers a question", %(
  As a user
  I want to view the answers for a question
  So that I can learn from the answer

  Acceptance Criteria

  [x] I must be on the question detail page
  [x] I must only see answers to the question I'm viewing
  [ ] I must see all answers listed in order, most recent last
) do

  let(:question){FactoryGirl.create(:question_with_answer)}

  scenario "User must be on the question detail page" do
    answer = FactoryGirl.create(:answer, question: question)
    visit question_path(question)

    expect(page).to have_content question.answers.first.description
  end

  scenario "User does not see answers to other question" do
    special_question = FactoryGirl.create(:special_question)
    special_answer = FactoryGirl.create(:answer, question: special_question)
    visit question_path(question)

    expect(page).to_not have_content special_answer.description
  end

  scenario "User sees answers listed in order, most recent answer last" do
    answer = FactoryGirl.create(:answer, question: question)
    another_answer = FactoryGirl.create(:answer, question: question)
    visit question_path(question)

    expect(page.body.index(answer.description)).to be < page.body.index(another_answer.description)
  end

end
