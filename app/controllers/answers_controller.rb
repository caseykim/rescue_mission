class AnswersController < ActionController::Base
  def create
    @question = Question.find(question_params)
    @answer = @question.answers.new(answer_params)
    if @answer.save
      flash[:notice] = 'Answer added.'
      redirect_to question_path(@question)
    else
      render :'questions/show'
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end

  def question_params
    params.require(:question_id)
  end
end
