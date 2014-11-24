class Question
  #question is in form (num1) (operation) (num2)
  attr_reader :correct

  def initialize
    @left_digit, @right_digit = gen_number(), gen_number()
    @operator = gen_operator()
  end
  def to_s
    "#{@left_digit} #{@operator} #{@right_digit}"
  end
  def get_answer()
    @input = gets.chomp().to_i
  end
  def check_answer
    @correct == eval(self.to_s).to_i
  end
end

class BasicQuestion < Question
  def gen_number()
    rand(9)
  end
  def gen_operator()
    ["+","-"].sample()
  end
end
class IntermediateQuestion < Question
  def gen_number()
    rand(9)
  end
  def gen_operator()
    ["*","/"].sample()
  end
end
class AdvancedQuestion < Question
  def gen_number()
    rand(89)+10
  end
  def gen_operator()
    ["+","-"].sample()
  end
end

class MasterQuestion < Question
  def gen_number()
    rand(89)+10
  end
  def gen_operator()
    ["*","/"].sample()
  end
end


