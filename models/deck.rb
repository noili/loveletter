require './models/princess'
require './models/countess'
require './models/king'
require './models/prince'
require './models/handmaid'
require './models/baron'
require './models/priest'
require './models/guard'

class Deck

  DECK_COMPOSITION = { Princess: 1, Countess: 1, King: 1, Prince: 2, Handmaid: 2, Baron: 2, Priest: 2, Guard: 5 }

  attr_accessor :cards

  def initialize
    self.cards = []
    DECK_COMPOSITION.each do |card, quantity|
      quantity.times { self.cards << Object.const_get(card.to_s).new }
    end
    self.cards.shuffle!
  end

  def pop
    cards.pop
  end

  def empty?
    cards.empty?
  end

end
