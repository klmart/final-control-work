class StudentTestsController < ApplicationController
  def get_test
    @test = Test.find(params[:id])
  end

  def student_test
    @student = @student.new(student_params)
  end

  def create

  end

  private
  def student_params
    params.require(:student).permit(:name, :last_name, :group)
  end


end
