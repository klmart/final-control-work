class Question < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 500}

  belongs_to :test
  has_many :answers

end
