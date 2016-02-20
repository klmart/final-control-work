class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    #@answer = Answer.new(answer_params)
    if @answer.save
      redirect_to question_url(@question.id)
    else
      render 'new'
    end
  end

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      question = @answer.question
      redirect_to question_url(question.id)
    else
      render 'edit'
    end
  end

  def create_answer_with_question
    @answer = Answer.new
    @question = Question.find(params[:id])
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:success] = 'Учетная запись успешно удалена'
    question = @answer.question
    redirect_to question_url(question.id)
  end

  private
  def answer_params
    params.require(:answer).permit(:content, :answer_status)
  end
end

