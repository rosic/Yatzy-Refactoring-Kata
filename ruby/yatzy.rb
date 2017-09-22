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

  def self.smallStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    (tallies[0] == 1 and
      tallies[1] == 1 and
      tallies[2] == 1 and
      tallies[3] == 1 and
      tallies[4] == 1) ? 15 : 0
  end

  def self.largeStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    if (tallies[1] == 1 and tallies[2] == 1 and tallies[3] == 1 and tallies[4] == 1 and tallies[5] == 1)
      return 20
    end
    return 0
  end

  def self.fullHouse( d1,  d2,  d3,  d4,  d5)
    tallies = []
    _2 = false
    i = 0
    _2_at = 0
    _3 = false
    _3_at = 0

    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    for i in Array 0..5
      if (tallies[i] == 2)
        _2 = true
        _2_at = i+1
      end
    end

    for i in Array 0..5
      if (tallies[i] == 3)
        _3 = true
        _3_at = i+1
      end
    end

    if (_2 and _3)
      return _2_at * 2 + _3_at * 3
    else
      return 0
    end
  end
end
