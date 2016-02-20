class Test < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 150 }
  validates :description, presence: true, length: { maximum: 300}
  has_many :questions
end
