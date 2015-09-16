require 'rails_helper'

feature "User deletes a question", %(
  As a user
  I want to delete a question
  So that I can delete duplicate questions

  Acceptance Criteria

  [x] I must be able delete a question from the question edit page
  [x] I must be able delete a question from the question details page
  [x] All answers associated with the question must also be deleted
) do
  let(:question){FactoryGirl.create(:question)}

  scenario "User can delete a question from the question edit page" do
    visit edit_question_path(question)
    click_link 'Delete'

    expect(page).to_not have_content(question.title)
  end

  scenario "User can delete a question from the question details page" do
    visit question_path(question)
    click_link 'Delete'

    expect(page).to_not have_content(question.title)
  end

  scenario "All answers associated with the question are deleted" do
    question_with_answer = FactoryGirl.create(:question_with_answer)
    visit question_path(question_with_answer)
    click_link 'Delete'

    expect(Answer.find_by(question: question_with_answer)).to be nil
  end
end
