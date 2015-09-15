class Answer < ActiveRecord::Base
  validates :description,
    presence: true,
    uniqueness: true,
    length: { minimum: 50 }

  belongs_to :question
end
