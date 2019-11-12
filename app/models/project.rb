class Project < ApplicationRecord
  belongs_to :user
  has_many :prompts
  has_many :answers, through: :prompts

  # before_create do
  #
  # end
  
end
