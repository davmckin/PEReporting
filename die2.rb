require 'minitest/autorun'
require_relative 'die2'

class Die

  include Comparable

attr_accessor :number_of_sides, :sides, :face

  def initialize(num = 6)
    @number_of_sides = num
    @sides = (1..number_of_sides).to_a
    roll
  end

  def roll
    self.face = sides.sample
  end

  def <=>(other)
    self.face <=> other.face
  end

  def +(other)
      face + other.face
  end

end
