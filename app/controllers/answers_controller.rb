class AnswersController < ApplicationController
  before_action :authenticate_user!

  def new
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    answer_statuses = Answer.where(question_id: @question.id, answer_status: true)
    if answer_statuses.empty?
      @answer.save
      redirect_to question_url(@question.id)
      flash[:succes] = 'Ответ успешно сохранен'
    elsif @answer.answer_status == false
      @answer.save
      flash[:succes] = 'Ответ успешно сохранен'
      redirect_to question_url(@question.id)
    else
      redirect_to question_url(@question.id)
      flash[:danger] = 'Правильный ответ уже есть'
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



