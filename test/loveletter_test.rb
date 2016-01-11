#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require '~/projects/loveletter/models/love_letter_game'
require 'pry'

class ArrayTest < Minitest::Test

  def game
    LoveLetterGame.new 'fede', 'olvap', 'liza', 'lio'
  end

  def test_start_new_game
    assert game.players.size == 4
  end

  def test_first_player_has_two_cards
    assert game.players.first.cards.size == 2
  end

  def test_deal_cards_at_game_start
    current_game = game
    current_game.players.each do |player|
      if current_game.current_player == player
        assert player.cards.size == 2
      else
        assert player.cards.size == 1
      end
    end
  end

  def test_deal_card_for_turn
    assert game.current_player.cards.size == 2
  end

  def test_current_player_plays
    current_game = LoveLetterGame.new 'olvap', 'fede'
    player = current_game.current_player
    current_game.play player.cards.first
    assert player != current_game.current_player
  end

  def test_win_by_high_card
    current_game = LoveLetterGame.new('fede', 'olvap')
    current_game.players.last.cards = [8]
    current_game.current_player.cards = [1]
    current_game.win_by_high_card
    assert current_game.winner = current_game.players.last
  end

  def test_win_by_knockout
    current_game = LoveLetterGame.new('fede')
    current_game.win_by_knockout
    assert current_game.winner.name == 'fede'
  end

end
