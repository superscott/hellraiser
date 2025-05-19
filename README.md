# Made with mostly with Cursor, as a way to wake your fingers up in the morning. 

## Ruby Quiz CLI

A command-line quiz application to test your Ruby knowledge! This interactive quiz covers various Ruby objects and their methods, helping you master Ruby's core functionality.

## Project Structure

The quiz is organized into three main files:
- `quiz.rb` - The main application that runs the quiz
- `questions.rb` - Contains all quiz questions (study from this file!)
- `answers.rb` - Contains test cases and solutions (reference after attempting questions)

## Objects Covered

### String Methods
- `include?` - Check if string contains substring
- `upcase` - Convert string to uppercase
- `strip` - Remove leading/trailing whitespace
- `split` - Split string into array using delimiter
- `gsub` - Global string substitution
- `length` - Get string length

### Array Methods
- `pop` - Remove and return last element
- `uniq` - Remove duplicate elements
- `sort` - Sort elements
- `push` - Add element to end of array
- `first` - Get first element
- `reverse` - Reverse array order

### Hash Methods
- `key?` - Check if key exists
- `values` - Get array of all values
- `keys` - Get array of all keys
- `fetch` - Get value with default option
- `merge` - Combine two hashes
- `empty?` - Check if hash is empty

### Integer Methods
- `even?` - Check if number is even
- `abs` - Get absolute value
- `odd?` - Check if number is odd
- `next` - Get next integer
- `positive?` - Check if number is positive
- `to_f` - Convert to float

### Enumerable Methods
- `map` - Transform each element
- `select` - Filter elements by condition
- `any?` - Check if any element matches condition
- `all?` - Check if all elements match condition
- `reduce` - Reduce collection to single value
- `find` - Get first element matching condition

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

