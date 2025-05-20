## About This Project
In in an effort to wake my fingers up in the morning, I wanted to create a Ruby Quiz with easy questions to help with keyboard finger memory placement.
I also wanted a way to create a quiz to which I did not already know the answers, so I used **Cursor**.
This project was created with significant help from **Cursor**, an AI-powered coding assistant. Cursor provided guidance, code generation, and productivity boosts throughout the development process, making it the main productive force behind this Ruby Quiz CLI.


## Ruby Quiz CLI

A command-line quiz application to test your Ruby knowledge! This interactive quiz covers various Ruby objects and their methods, helping you master Ruby's core functionality.

## Project Structure

The quiz is organized into three main files:
- `quiz.rb` - The main application that runs the quiz
- `questions.rb` - Contains all quiz questions (study from this file!)
- `answers.rb` - Contains test cases and solutions (reference after attempting questions)

## Objects Covered

### String Methods
- 6 methods covered

### Array Methods
- 6 methods covered

### Hash Methods
- 6 methods covered

### Integer Methods
- 6 methods covered

### Enumerable Methods
- 6 methods covered

## Installation

1. Make sure you have Ruby installed on your system
2. Clone this repository
3. Run `bundle install` to install dependencies
4. Run `ruby quiz.rb` to start the quiz

## How to Study

1. Review the methods in this README to understand what's covered
2. Open `questions.rb` to see all questions without solutions
3. Try solving the questions on your own
4. Run the quiz with `ruby quiz.rb` to test your knowledge
5. After attempting a question, check `answers.rb` for solutions and explanations

## Quiz Features

- Interactive quiz questions about Ruby objects and methods
- Real-time code evaluation
- Immediate feedback on your answers
- Detailed explanations for each method
- Colorful terminal output
- Score tracking
- Random question order for varied practice
- Separated questions and answers for better learning
- **Hints available after incorrect answers**
- **Option to see the full answer and explanation after at least one incorrect attempt**
- **Retry questions up to 3 times, or practice after seeing the answer (no points)**
- **View your stats after each question**
- **Flexible menu after each incorrect answer: retry, show hint, show answer, view stats, or move on**
- **Only first correct answers (before seeing the answer) count towards your score and stats**

## Quiz Flow

1. Each round consists of 5 random questions.
2. For each question:
   - You have up to 3 attempts to answer correctly.
   - After an incorrect answer, you can:
     - Try again (if attempts remain)
     - See a hint (the method name being tested)
     - See the answer and explanation (after at least one incorrect attempt; counts as incorrect)
     - View your current stats (then move to the next question)
     - Move to the next question
   - After seeing the answer, you can retry for practice (no points awarded).
3. After each round, you can view your stats and choose to continue or exit.
4. Your score only increases if you answer correctly before seeing the answer.

## How It Works

1. Each question provides you with a test variable
2. You write actual Ruby code using the provided variable
3. Your code is evaluated in real-time
4. You get immediate feedback on your answer
5. You can view a hint or the full answer if you get stuck
6. An explanation of the correct method is provided
7. You can view your stats at any time after a question

## Example Question

```ruby
Category: String
Using the variable 'test_string' containing 'hello world', write code that returns true if it contains 'lo':

# Your answer would be:
test_string.include?('lo')
```

## File Organization

### questions.rb
- Contains only the questions
- Organized by object type
- Great for studying and practice

### answers.rb
- Contains test cases and solutions
- Includes detailed explanations
- Reference after attempting questions

### quiz.rb
- Main quiz application
- Handles code evaluation
- Provides immediate feedback

