class Session < ApplicationRecord
  belongs_to :project
  has_many :prompts, through: :project

  before_create do
    self.set_pin
  end

  def self.pin_is_unique?(pin)
    pins = Session.all.select(:pin)
    # if pins includes new_pin, return false, else true
    !(pins.include?(pin))
    # !!Session.all.find_by(pin: pin)
  end

  def self.get_random_string(length=5)
    # source=("a".."z").to_a + ("A".."Z").to_a + (0..9).to_a + ["_","-","."]
    source = ('A'..'Z').to_a + (2..9).to_a
    new_pin = ""
    length.times{ new_pin += source[rand(source.size)].to_s }
    return new_pin
  end

  def set_pin
    # set a random 5 digit string
    new_pin = Session.get_random_string(5)
    # check if pin already exists
    if Session.pin_is_unique?(new_pin)
      # if the pin is unique, set it as session's pin
      self.pin = new_pin
    else
      # if pin already exists, do entire thing again
      self.reset_pin
    end
  end

  def reset_pin
    self.set_pin
  end


end
