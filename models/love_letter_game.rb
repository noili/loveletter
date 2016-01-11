require_relative 'player'
require_relative 'deck'
require './models/princess'
require './models/countess'
require './models/king'
require './models/prince'
require './models/handmaid'
require './models/baron'
require './models/priest'
require './models/guard'

class LoveLetterGame

  attr_accessor :players, :deck, :winner

  def initialize *names
    self.players = names.map { |name| Player.new name }
    self.deck = Deck.new
    deal_starting_cards
  end

  def ended?
    deck.empty? || players.size == 1
  end

  def deal_starting_cards
    players.each { |player| player.cards << deck.pop }
    deal_card
  end

  def deal_card
    players.first.cards << deck.pop
  end

  def play card
    raise 'el juego termino' if ended?
    current_player.play card
    puts "player plays #{card}"
    players.rotate!
    deal_card
    puts "le toca a #{current_player.name}"
  end

  def current_player
    players.first
  end

  def win_by_high_card
    players.each do |player|
      if player.cards.last > current_player.cards.last
        self.winner = player
      end
    end
  end

  def win_by_knockout
    self.winner = players.first
  end

end
