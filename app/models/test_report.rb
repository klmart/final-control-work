class TestReport < ActiveRecord::Base
  belongs_to :student
  belongs_to :test
end
