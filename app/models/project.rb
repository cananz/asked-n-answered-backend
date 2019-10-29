class Project < ApplicationRecord
  belongs_to :user
  has_many :prompts
  has_many :answers, through: :prompts
end
