#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'princess'
require 'pry'

class ArrayTest < Minitest::Test

  def test_princess_play
    assert Princess.new.play == 'You are knocked from the round.'
  end

end
