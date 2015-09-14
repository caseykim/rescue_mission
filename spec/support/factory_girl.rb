require 'factory_girl'

FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "Question #{n}" * 10 }
    description "description" * 20

    factory :special_question do
      title "Special Question" * 10
    end
  end

end
