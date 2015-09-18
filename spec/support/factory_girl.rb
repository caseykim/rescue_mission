require 'factory_girl'

FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Question #{n}" * 10 }
    description "description" * 20

    factory :special_question do
      title "Special Question" * 10
    end

    factory :question_with_answer do
      after(:create) do |question|
        create(:answer, question: question)
      end
    end
    
    factory :question_with_answers do
      after(:create) do |question|
        5.times {create(:answer, question: question)}
      end
    end

  end

  factory :answer do
    sequence(:description) { |n| "description #{n}" * 5 }
    question {Question.first}
  end

end
