SUITS = [:spade, :heart, :club, :diamond]
RANKS = [:ace, :king, :queen, :jack, :ten, :nine, :eight, :seven, :six, :five, :four, :three, :two]
class Card
    attr_reader :suit, :rank
    def initialize suit, rank
        if (!SUITS.include?(suit) || !RANKS.include?(rank))
            raise "bad card entry"
        end
        @suit, @rank = suit, rank
        
    end

    def == other
		rank == other.rank && suit == other.suit
	end

	def > other
		#lower position in the array means higher value
		RANKS[rank] < RANKS[other.rank] && SUITS[suit] < SUITS[other.suit]
	end

	def < other
		RANKS[rank] > RANKS[other.rank] && SUITS[suit] > SUITS[other.suit]
	end

    def to_s
        @suit.to_s + ", " + @rank.to_s
    end
end

class Deck
    def initialize num_decks
        @cards = []
        @discard = []
        num_decks.times {
            |i| for rank in RANKS
                for suit in SUITS
                    @cards.append(Card.new(suit, rank))
                end
            end
        }
        @cards = @cards.shuffle
    end

    def draw
        card = @cards.pop
        @discard.append(card)
        card
    end

    def to_s
        for card in @cards
            puts card
        end
    end
end

x = Deck.new(1)


