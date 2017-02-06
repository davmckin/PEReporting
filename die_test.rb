require 'minitest/autorun'

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

class DieTest < MiniTest::Test

  def test_the_truth
    assert true == true
  end

  def test_the_nil
      assert nil.nil?
  end

  def test_die_has_sides
    assert Die.new.number_of_sides == 6
  end

  def test_a_die_can_have_20_sides
    assert Die.new(20).number_of_sides == 20
  end

  def test_a_die_cn_be_rolled
    assert Die.new.roll.between?(1,6)
  end

  def test_die_can_be_added
  die = Die.new
  die2 = Die.new
  number = die + die2
  assert number.is_a? Fixnum
  end

  def test_math_is_correct
  die = Die.new
  die2= Die.new
  number = die + die2
  assert (die.face + die2.face) == number
  end

  def test_die_can_be_compared
    die = Die.new
    die2 = Die.new
    die.face = 6
    die2.face = 3
    assert die > die2
  end

end
