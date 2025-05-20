#!/usr/bin/env ruby

require 'colorize'
require 'tty-prompt'
require_relative 'questions'
require_relative 'answers'

class RubyQuiz
  QUESTIONS_PER_ROUND = 5

  def initialize
    @prompt = TTY::Prompt.new
    @total_score = 0
    @total_questions = 0
    @questions = QuizQuestions::QUESTIONS
    @answers = QuizAnswers::ANSWERS
    @current_round = 1
  end

  def run
    display_welcome_message
    ask_questions
  end

  private

  def display_welcome_message
    puts "\nWelcome to the Ruby Quiz!".colorize(:cyan)
    puts "Test your knowledge of Ruby objects and methods.".colorize(:cyan)
    puts "\nThis quiz requires you to write actual Ruby code that will be evaluated.".colorize(:yellow)
    puts "Each answer should be a single line of Ruby code.".colorize(:yellow)
    puts "\nThe quiz is organized in rounds of #{QUESTIONS_PER_ROUND} questions.".colorize(:green)
    puts "After each round, you'll see your stats and can choose to continue or exit.".colorize(:green)
    puts "\nAfter an incorrect answer:".colorize(:yellow)
    puts "- You can get a hint showing the method name".colorize(:yellow)
    puts "- You can practice the same question up to 2 more times".colorize(:yellow)
    puts "- Skip to the next question".colorize(:yellow)
    puts "\nPress Enter to start...".colorize(:yellow)
    gets
  end

  def ask_questions
    loop do
      puts "\n=== Round #{@current_round} ===".colorize(:magenta)
      
      # Reset round-specific stats
      round_score = 0
      round_questions = 0
      
      # Get all questions paired with their answers and shuffle them
      questions_with_answers = @questions.zip(@answers).shuffle
      
      # Take only QUESTIONS_PER_ROUND questions for this round
      round_questions_with_answers = questions_with_answers.take(QUESTIONS_PER_ROUND)
      
      round_questions_with_answers.each do |question, answer|
        attempts_remaining = 3
        hint_shown = false
        answer_shown = false
        
        loop do
          round_questions += 1 if !answer_shown  # Only increment if not retrying after seeing answer
          @total_questions += 1 if !answer_shown # Only increment if not retrying after seeing answer
          
          was_correct = ask_question(question, answer, attempts_remaining)
          
          if was_correct
            round_score += 1 if !answer_shown  # Only award points if answer wasn't shown
            @total_score += 1 if !answer_shown # Only award points if answer wasn't shown
            
            choice = @prompt.select("What would you like to do?", {
              'Next question' => :next,
              'Show current stats' => :stats,
              'Exit quiz' => :exit
            })

            case choice
            when :next
              break
            when :stats
              display_current_stats(round_score, round_questions)
              break
            when :exit
              display_final_stats
              exit(0)
            end
          else
            # Build options based on attempts remaining and whether hint/answer were shown
            options = {}
            
            if attempts_remaining > 1 && !answer_shown
              options['Try this question again'] = :retry
              options['Show hint'] = :hint
            end

            # Show answer option after first attempt, regardless of hint status
            if attempts_remaining < 3 && !answer_shown
              options['Show answer'] = :show_answer
            end
            
            if answer_shown
              options['Try this question again (no points)'] = :retry
            end
            
            options['Next question'] = :next
            options['Show current stats'] = :stats
            options['Exit quiz'] = :exit

            choice = @prompt.select("What would you like to do?", options)

            case choice
            when :hint
              show_hint(answer)
              hint_shown = true
              next
            when :show_answer
              show_answer(answer)
              answer_shown = true
              next
            when :retry
              attempts_remaining -= 1 unless answer_shown  # Don't decrement attempts if practicing after seeing answer
              next
            when :next
              break
            when :stats
              display_current_stats(round_score, round_questions)
              break
            when :exit
              display_final_stats
              exit(0)
            end
          end
        end
      end
      
      # Round completed
      display_round_stats(round_score)
      @current_round += 1
      
      choice = @prompt.select("Would you like to continue?", {
        'Start next round' => :continue,
        'Exit quiz' => :exit
      })

      if choice == :exit
        display_final_stats
        exit(0)
      end
    end
  end

  def ask_question(question_data, answer_data, attempts_remaining)
    puts "\nCategory: #{question_data[:category]}".colorize(:blue)
    puts question_data[:question].colorize(:white)
    if attempts_remaining < 3
      puts "(Attempt #{4 - attempts_remaining} of 3)".colorize(:yellow)
    end
    
    answer = @prompt.ask("Your code:") do |q|
      q.required true
      q.modify :strip
    end


    if answer.strip.downcase == 'exit' || answer.strip.downcase == 'quit'
      display_final_stats
      exit(0)
    end

    check_answer(answer, answer_data)
  end

  def check_answer(user_code, answer_data)
    test_case = answer_data[:test_cases].first
    
    # Create a clean binding for evaluation
    eval_binding = binding.clone
    
    begin
      # Set up the test environment
      eval(test_case[:setup], eval_binding)
      
      # Evaluate user's code
      user_result = eval(user_code, eval_binding)
      
      # Evaluate expected result
      expected_result = eval(test_case[:expected], eval_binding)
      
      correct = user_result == expected_result
      
      if correct
        puts "\n✅ Correct!".colorize(:green)
        puts "Your code returned: #{user_result.inspect}".colorize(:green)
      else
        puts "\n❌ Incorrect.".colorize(:red)
        puts "Your code returned: #{user_result.inspect}".colorize(:red)
        puts "Expected: #{expected_result.inspect}".colorize(:yellow)
      end
      
      return correct
      
    rescue => e
      puts "\n❌ Error in your code:".colorize(:red)
      puts e.message.colorize(:red)
      return false
    end
  end

  def show_hint(answer_data)
    test_case = answer_data[:test_cases].first
    method_name = extract_method_name(test_case[:expected])
    puts "\nHint: This question is testing the ".colorize(:cyan) + 
         "#{method_name}".colorize(:yellow) + 
         " method.".colorize(:cyan)
  end

  def extract_method_name(expected_code)
    # Extract method name from the expected code
    if match = expected_code.match(/\.([\w?!]+)/)
      match[1]
    else
      "unknown"
    end
  end

  def show_answer(answer_data)
    test_case = answer_data[:test_cases].first
    puts "\nThe correct answer is:".colorize(:cyan)
    puts test_case[:expected].colorize(:yellow)
    puts "\nExplanation:".colorize(:cyan)
    puts test_case[:explanation].colorize(:yellow)
  end

  def display_current_stats(round_score, round_questions)
    puts "\nCurrent Round Stats:".colorize(:cyan)
    puts "Round: #{@current_round}".colorize(:cyan)
    puts "Questions Attempted in Round: #{round_questions}".colorize(:cyan)
    puts "Correct Answers in Round: #{round_score}".colorize(:cyan)
    
    if round_questions > 0
      round_percentage = (round_score.to_f / round_questions * 100).round(2)
      puts "Current Round Accuracy: #{round_percentage}%".colorize(:cyan)
    end
    
    puts "\nOverall Stats:".colorize(:magenta)
    puts "Total Questions Attempted: #{@total_questions}".colorize(:magenta)
    puts "Total Correct Answers: #{@total_score}".colorize(:magenta)
    
    if @total_questions > 0
      total_percentage = (@total_score.to_f / @total_questions * 100).round(2)
      puts "Overall Accuracy: #{total_percentage}%".colorize(:magenta)
    end
  end

  def display_round_stats(round_score)
    round_percentage = (round_score.to_f / QUESTIONS_PER_ROUND * 100).round(2)
    
    puts "\n=========================================".colorize(:green)
    puts "      Round #{@current_round} Completed!".colorize(:green)
    puts "=========================================".colorize(:green)
    puts "Questions: #{QUESTIONS_PER_ROUND}".colorize(:cyan)
    puts "Correct Answers: #{round_score}".colorize(:cyan)
    puts "Round Accuracy: #{round_percentage}%".colorize(:cyan)
    
    case round_percentage
    when 80..100
      puts "Excellent round! 🌟".colorize(:green)
    when 60..79
      puts "Good job! 👍".colorize(:yellow)
    else
      puts "Keep practicing! 💪".colorize(:magenta)
    end
  end

  def display_final_stats
    puts "\n=== Final Statistics ===".colorize(:green)
    puts "Total Rounds Completed: #{@current_round - 1}".colorize(:cyan)
    puts "Total Questions Attempted: #{@total_questions}".colorize(:cyan)
    puts "Total Correct Answers: #{@total_score}".colorize(:cyan)
    
    if @total_questions > 0
      percentage = (@total_score.to_f / @total_questions * 100).round(2)
      puts "Final Accuracy: #{percentage}%".colorize(:cyan)
      
      case percentage
      when 90..100 then puts "Excellent! You're a Ruby master! 🌟".colorize(:green)
      when 70..89 then puts "Good job! Keep practicing! 👍".colorize(:yellow)
      else puts "Keep learning! You'll get better! 💪".colorize(:red)
      end
    end
  end
end

# Start the quiz
begin
  RubyQuiz.new.run
rescue Interrupt
  puts "\n\nExiting quiz...".colorize(:yellow)
  exit(0)
end
