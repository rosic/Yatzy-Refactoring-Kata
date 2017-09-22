require_relative './yatzy'
require 'rspec/autorun'

describe Yatzy do
  it "chance scores sum of all dice" do
    expect(Yatzy.chance(2,3,4,5,1)).to eq 15
    expect(Yatzy.chance(3,3,4,5,1)).to eq 16
  end

  it "Yatzy scores 50" do
    expect(Yatzy.yatzy([4,4,4,4,4])).to eq 50
    expect(Yatzy.yatzy([6,6,6,6,6])).to eq 50
    expect(Yatzy.yatzy([6,6,6,6,3])).to eq 0
  end

  it "ones score accordingly" do
    expect(Yatzy.ones(1,2,1,4,5)).to eq 2
    expect(Yatzy.ones(1,2,3,4,5)).to eq 1
    expect(Yatzy.ones(6,2,2,4,5)).to eq 0
    expect(Yatzy.ones(1,2,1,1,1)).to eq 4
  end

  it "twos score accordingly" do
    expect(Yatzy.twos(1,2,3,2,6)).to eq 4
    expect(Yatzy.twos(2,2,2,2,2)).to eq 10
  end

  it "threes score accordingly" do
    expect(Yatzy.threes(1,2,3,2,3)).to eq 6
    expect(Yatzy.threes(2,3,3,3,3)).to eq 12
  end

  it "fours score accordingly" do
    expect(Yatzy.new(4,4,4,5,5).fours).to eq 12
    expect(Yatzy.new(4,4,5,5,5).fours).to eq 8
    expect(Yatzy.new(4,5,5,5,5).fours).to eq 4
  end

  it "fives score accordingly" do
    expect(Yatzy.new(4,4,4,5,5).fives()).to eq 10
    expect(Yatzy.new(4,4,5,5,5).fives()).to eq 15
    expect(Yatzy.new(4,5,5,5,5).fives()).to eq 20
  end

  it "sixes score accordingly" do
    expect(Yatzy.new(4,4,4,5,5).sixes()).to eq 0
    expect(Yatzy.new(4,4,6,5,5).sixes()).to eq 6
    expect(Yatzy.new(6,5,6,6,5).sixes()).to eq 18
  end

  it "one pair" do
    expect(Yatzy.score_pair(3,4,3,5,6)).to eq 6
    expect(Yatzy.score_pair(5,3,3,3,5)).to eq 10
    expect(Yatzy.score_pair(5,3,6,6,5)).to eq 12
  end

  it "two pair" do
    expect(Yatzy.two_pair(3,3,5,4,5)).to eq 16
    expect(Yatzy.two_pair(3,3,5,5,5)).to eq 16
  end

  it "three of a kind" do
    expect(Yatzy.three_of_a_kind(3,3,3,4,5)).to eq 9
    expect(Yatzy.three_of_a_kind(5,3,5,4,5)).to eq 15
    expect(Yatzy.three_of_a_kind(3,3,3,3,5)).to eq 9
  end

  it "four of a kind" do
    expect(Yatzy.four_of_a_kind(3,3,3,3,5)).to eq 12
    expect(Yatzy.four_of_a_kind(5,5,5,4,5)).to eq 20
    expect(Yatzy.three_of_a_kind(3,3,3,3,3)).to eq 9
    expect(Yatzy.four_of_a_kind(3,3,3,3,3)).to eq 12
  end

  it "small straight" do
    expect(Yatzy.smallStraight(1,2,3,4,5)).to eq 15
    expect(Yatzy.smallStraight(2,3,4,5,1)).to eq 15
    expect(Yatzy.smallStraight(1,2,2,4,5)).to eq 0
  end

  it "large straight" do
    expect(Yatzy.largeStraight(6,2,3,4,5)).to eq 20
    expect(Yatzy.largeStraight(2,3,4,5,6)).to eq 20
    expect(Yatzy.largeStraight(1,2,2,4,5)).to eq 0
  end

  it "full house" do
    expect(Yatzy.fullHouse(6,2,2,2,6)).to eq 18
    expect(Yatzy.fullHouse(2,3,4,5,6)).to eq 0
  end
end
