# frozen_string_literal: true

require_relative 'job'
require_relative 'pet'

class Human
  attr_accessor :pet, :money, :name, :job

  FEED_PRICE = 5
  def initialize(name: '', money: 0, job: Job.new, pet: Pet.new)
    @name = name
    @money = money
    @job = job
    @pet = pet
  end

  def work
    self.money += job.get_salary
    'You get salary'
  end

  def feed_pet
    if (money - FEED_PRICE).negative?
      'You not have enough money to feed your pet!'
    elsif pet.eat == 'I not hungry'
      'Pet is fed'
    else
      self.money -= FEED_PRICE
      'Pet is fed'
    end
  end
end
