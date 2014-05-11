class MoneyCalculator

	attr_accessor :ones
	attr_accessor :fives
	attr_accessor :tens
	attr_accessor :twenties
	attr_accessor :fifties
	attr_accessor :hundreds
	attr_accessor :five_hundreds
	attr_accessor :thousands
	attr_accessor :quantity
	attr_accessor :price
	attr_accessor :total
  def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands, quantity, price)
	@ones = ones.to_f
	@fives = fives.to_f * 5
	@tens = tens.to_f * 10
	@twenties = twenties.to_f * 20
	@fifties = fifties.to_f * 50
	@hundreds = hundreds.to_f * 100
	@five_hundreds = five_hundreds.to_f * 500
	@thousands = thousands.to_f * 1000
	@quantity = quantity.to_f
	@price = price.to_f
    # each parameter represents the quantity per denomination of money
    # these parameters can be assigned to instance variables and used for computation

    # add a method called 'change' that takes in a parameter of how much an item costs
    # and returns a hash of how much change is to be given
    # the hash will use the denominations as keys and the amount per denomination as values
    # i.e. {:fives => 1, fifties => 1, :hundreds => 3}
  end

	def adder
		total = ones + fives + tens + twenties + fifties + hundreds + five_hundreds + thousands
		return total
	end
	def amount
		amt = quantity*price
		return amt
	end
	def change
		ch = adder - amount
		return ch
	end
		def message
		if adder > amount	
			 "Thank you very much for buying!"	
		
		elsif adder < amount
			 "Error: Please enter right amount"	
		end
		end
end
