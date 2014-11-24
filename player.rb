require_relative 'question.rb'
require_relative 'question_list'

class Player
  attr_reader :name, :questions, :score

  def initialize(config)
    @name = config[0]
    @turns = config[1].to_i
    @random = Random.new(config[2].to_i)
    @questions = QuestionList.new
    @score = 0
  end

  def welcome
    puts "Welcome to the Arithmetic Tutor #{@name}"
  end

  def ask_question(level)
    case level
      when 1
        question = BasicQuestion.new()
      when 2
        question = IntermediateQuestion.new()
      when 3
        question = AdvancedQuestion.new()
      when 4
        question = MasterQuestion.new()
      else
        question = BasicQuestion.new()
    end

    print "What is #{question}? "
    answer = gets.chomp.to_i
    question.get_answer # the get answer method doesn't take an argument, that's why that won't work
    @questions.add_question question
    question
  end

  def play
    level = 1
    winning_streak = 0
    losing_streak = 0

    @turns.times() do |i|
      question = ask_question(level)

      if question.correct
        @score += level
        winning_streak += 1
        losing_streak = 0
      else
        winning_streak = 0
        losing_streak += 1
      end

      if winning_streak == 2 && level < 4
        level += 1
        winning_streak = 0
        losing_streak = 0
      elsif losing_streak == 2 && level > 1
        level -= 1
        losing_streak = 0
        winning_streak = 0
      end
    end
  end

  def print_results
    puts "\nYour results were as follows"
    puts "SCORE = #{@score}"
    puts @questions
  end

end
