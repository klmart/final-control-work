class StudentTestsController < ApplicationController
  def get_test
    @test = Test.find(params[:id])
  end

end
