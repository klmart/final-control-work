class QuestionsController < ApplicationController
    def new
      @question = Question.new
    end

    def create
      @test = Test.find(params[:test_id])
      #@question = Question.new(question_params)
      @question = @test.questions.create(question_params)

      if @question.save
        redirect_to test_url(@test.id)
      else render 'new'
      end
    end

    def index
      @questions = Question.all
    end

    def show
      @question = Question.find(params[:id])
    end

    def edit
      @question = Question.find(params[:id])
    end

    def update
      @question = Question.find(params[:id])
      if @question.update(question_params)
        redirect_to questions_url
      else
        render 'edit'
      end
    end

    def create_question_with_test
      @question = Question.new
      @test = Test.find(params[:id])
    end

    private
    def question_params
      params.require(:question).permit(:content, :test_id)
    end
  end
