class Yatzy
  def self.chance(*dice)
    dice.take(5).sum
  end

  def self.yatzy(dice)
    return 50 if dice.uniq.size == 1

    0
  end

  %i(ones twos threes fours fives sixes).each_with_index do |method, index|
    define_singleton_method method do |*dice|
      dice.select { |i| i == index + 1 }.sum
    end
  end

  def initialize(*dice)
    @dice = dice
  end

  def fours
    self.class.fours(*@dice)
  end

  def fives
    self.class.fives(*@dice)
  end

  def sixes
    self.class.sixes(*@dice)
  end

  def self.score_pair(*dice)
    dice_occurring_more_often_than(dice, 1).keys.max * 2
  end

  def self.two_pair(*dice)
    matching_dice = dice_occurring_more_often_than(dice, 1)

    return 0 if matching_dice.size < 2

    matching_dice.keys.sum * 2
  end

  def self.four_of_a_kind(*dice)
    dice_occurring_more_often_than(dice, 3).
      keys.first.to_i * 4
  end

  def self.dice_occurring_more_often_than(dice, count)
    dice.group_by(&:itself).map do |k, v|
      [k, v.size]
    end.to_h.select do |k, v|
      v > count
    end
  end

  def self.three_of_a_kind(*dice)
    dice_occurring_more_often_than(dice, 2).
      keys.first.to_i * 3
  end

  def self.smallStraight(*dice)
    return 0 if dice.uniq.size < 5
    return 0 if dice.max > 5

    15
  end

  def self.largeStraight(*dice)
    return 0 if dice.uniq.size < 5
    return 0 if dice.min == 1

    20
  end

  def self.fullHouse(*dice)
    return 0 if dice_occurring_more_often_than(dice, 1).size != 2

    dice.sum
  end
end
