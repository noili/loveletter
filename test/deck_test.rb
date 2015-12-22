#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require '~/projects/loveletter/models/deck'
require 'pry'

class ArrayTest < Minitest::Test

  def test_initialize
    deck = Deck.new
    assert deck.cards.size == 16
  end

end
