class Student < ActiveRecord::Base
  has_many :test_reports
end
