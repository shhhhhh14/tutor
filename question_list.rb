class QuestionList

  def initialize
    @questions = Array.new
  end

  def add_question(question)
    @questions.push(question)
  end

  def to_s
    str = ''           
    @questions.each do |question|
      if question.correct
        str += "What is #{question}?: Correct\n"
      end
    end

    @questions.each do |question|
      if not question.correct
        str += "What is #{question}): Incorrect\n"
      end
    end

    str
  end
end
