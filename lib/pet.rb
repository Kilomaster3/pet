# frozen_string_literal: true

class Pet
  attr_accessor :type, :name, :hungry

  EAT_VALUE = 10
  PLAY_VALUE = 15

  def initialize(name: '', type: :dog)
    @name = name
    @type = type
    @hungry = 100
  end

  def eat
    hungry == 100 ? 'I am not hungry' : self.hungry = (hungry + EAT_VALUE) - (hungry + EAT_VALUE) % 100
  end

  def play
    (hungry - PLAY_VALUE).negative? ? 'I can not play' : self.hungry -= PLAY_VALUE
  end
end
