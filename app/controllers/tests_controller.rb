class TestsController < ApplicationController
  before_action :authenticate_user!

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_url
    else
      render 'new'
    end
  end

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
    @questions = Question.where(test_id: @test.id)
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
    if @test.update(test_params)
      redirect_to tests_url
    else
      render 'edit'
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    flash[:success] = 'Учетная запись успешно удалена'
    redirect_to tests_url
  end

  private
  def test_params
    params.require(:test).permit(:name, :link, :description)
  end
end
