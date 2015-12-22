#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require '~/projects/loveletter/models/player'
require 'pry'

class ArrayTest < Minitest::Test

  def test_player_plays_card
    fede = Player.new 'fede'
    fede.cards = [Princess.new, Guard.new]
    fede.play fede.cards.first
    assert fede.cards.size == 1
  end

end
