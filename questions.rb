class Question
  attr_reader :question, :answer

  def initialize
    num1 = rand(1..20)
    num2 = rand(1..20)

    symbols = [ "+", "-", "*"]
  
    symbol = symbols.sample
    @answer = num1.send(symbol, num2)
    @question = "What is #{num1.to_s} #{symbol} #{num2.to_s}?"
  end
end