class Answer < ActiveRecord::Base
  validates :description,
    presence: true,
    uniqueness: true,
    length: { minimum: 50 }

  belongs_to :question

  class << self
    def best
      find_by(best: true)
    end

    def other
      where(best: [false,nil])
    end
  end
end
