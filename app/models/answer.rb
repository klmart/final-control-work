class Answer < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 500}
  belongs_to :question
end
