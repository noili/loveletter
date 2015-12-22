require './models/princess'
require './models/countess'
require './models/king'
require './models/prince'
require './models/handmaid'
require './models/baron'
require './models/priest'
require './models/guard'

class Player

  attr_accessor :name, :cards

  def initialize name
    self.name = name
    self.cards = []
  end

  def cards_in_hand
    2
  end

  def play card
    puts card.play
    cards.delete_at(cards.index(card) || cards.length)
  end

end
