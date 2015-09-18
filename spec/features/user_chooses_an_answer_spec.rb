require 'rails_helper'

feature "User chooses an answer", %(
  As a user
  I want to mark an answer as the best answer
  So that others can quickly find the answer

  Acceptance Criteria

  [ ] I must be on the question detail page
  [ ] I must be able mark an answer as the best
  [ ] I must see the "best" answer above all other answers in the answer list
) do

  let(:question) {FactoryGirl.create(:question_with_answers)}

  scenario "User marks an answer as the best" do
    visit question_path(question)
    answer = question.answers.last
    answer_css = "#answer-#{answer.id}"
    find( answer_css, "Accept" ).click
    first_answer = page.all(".answers li")[0]

    expect(find(".answers li", text: answer.description)).to eq first_answer
  end

end
