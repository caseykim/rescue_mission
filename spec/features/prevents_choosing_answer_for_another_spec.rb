require 'rails_helper'

feature "User prevents other users from choosing the answer for his question", %(
  As a user
  I want to prevent other users from choosing the "best" answer for my question
  So that malicious users can't mess with my question

  Acceptance Criteria

  [ ] I must be signed in
  [ ] I must be able to choose the "best" answer for a question that I posted
  [ ] I can't choose the best answer for a question that was posted by another user
) do
  
end
