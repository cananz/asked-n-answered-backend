class Project < ApplicationRecord
  belongs_to :user
  has_many :prompts
  has_many :answers, through: :prompts
  has_many :sessions

  # before_create do
  #
  # end

  def pin
    if self.object.sessions.count > 0
      self.object.sessions.first.pin
    else
      "no sessions"
    end
  end

end
