module QuizQuestions
  QUESTIONS = [
    # String Questions
    {
      category: 'String',
      question: "Using the variable 'test_string' containing 'hello world', write code that returns true if it contains 'lo', false otherwise:"
    },
    {
      category: 'String',
      question: "Using the variable 'test_string' containing 'hello world', write code that converts it to uppercase:"
    },
    {
      category: 'String',
      question: "Using the variable 'test_string' containing '  trim me  ', write code that removes leading and trailing whitespace:"
    },
    {
      category: 'String',
      question: "Using the variable 'test_string' containing 'hello,world', write code that splits it into an array using ',' as delimiter:"
    },
    {
      category: 'String',
      question: "Using the variable 'test_string' containing 'hello world', write code that replaces all 'l' characters with 'x':"
    },
    {
      category: 'String',
      question: "Using the variable 'test_string' containing 'hello world', write code that returns its length:"
    },

    # Array Questions
    {
      category: 'Array',
      question: "Using the variable 'test_array' containing [1, 2, 3], write code that removes and returns the last element:"
    },
    {
      category: 'Array',
      question: "Using the variable 'test_array' containing [1, 2, 2, 3, 3], write code that returns an array with duplicate elements removed:"
    },
    {
      category: 'Array',
      question: "Using the variable 'test_array' containing [3, 1, 4, 1, 5], write code that sorts the array:"
    },
    {
      category: 'Array',
      question: "Using the variable 'test_array' containing [1, 2, 3], write code that adds the number 4 to the end:"
    },
    {
      category: 'Array',
      question: "Using the variable 'test_array' containing [1, 2, 3], write code that returns the first element:"
    },
    {
      category: 'Array',
      question: "Using the variable 'test_array' containing [1, 2, 3], write code that reverses the array:"
    },

    # Hash Questions
    {
      category: 'Hash',
      question: "Using the variable 'test_hash' containing {name: 'Ruby', type: 'language'}, write code that returns true if it has the key :name:"
    },
    {
      category: 'Hash',
      question: "Using the variable 'test_hash' containing {a: 1, b: 2}, write code that returns an array of all values:"
    },
    {
      category: 'Hash',
      question: "Using the variable 'test_hash' containing {a: 1, b: 2}, write code that returns an array of all keys:"
    },
    {
      category: 'Hash',
      question: "Using the variable 'test_hash' containing {a: 1}, write code that returns the value for key :a with a default of 0 if the key doesn't exist:"
    },
    {
      category: 'Hash',
      question: "Using the variable 'test_hash' containing {a: 1, b: 2}, write code that merges it with {c: 3} to create a new hash:"
    },
    {
      category: 'Hash',
      question: "Using the variable 'test_hash' containing {a: 1, b: 2}, write code that returns true if it is empty:"
    },

    # Integer Questions
    {
      category: 'Integer',
      question: "Using the variable 'test_number' containing 42, write code that returns true if it is even, false otherwise:"
    },
    {
      category: 'Integer',
      question: "Using the variable 'test_number' containing -5, write code that returns its absolute value:"
    },
    {
      category: 'Integer',
      question: "Using the variable 'test_number' containing 7, write code that returns true if it is odd:"
    },
    {
      category: 'Integer',
      question: "Using the variable 'test_number' containing 5, write code that returns the next integer:"
    },
    {
      category: 'Integer',
      question: "Using the variable 'test_number' containing 8, write code that returns true if it is positive:"
    },
    {
      category: 'Integer',
      question: "Using the variable 'test_number' containing 10, write code that converts it to a float:"
    },

    # Enumerable Questions
    {
      category: 'Enumerable',
      question: "Using the variable 'test_array' containing [1, 2, 3], write code that returns a new array with each element doubled:"
    },
    {
      category: 'Enumerable',
      question: "Using the variable 'test_array' containing [1, 2, 3, 4, 5], write code that returns elements greater than 3:"
    },
    {
      category: 'Enumerable',
      question: "Using the variable 'test_array' containing [1, 2, 3, 4], write code that returns true if any number is even:"
    },
    {
      category: 'Enumerable',
      question: "Using the variable 'test_array' containing [2, 4, 6, 8], write code that returns true if all numbers are even:"
    },
    {
      category: 'Enumerable',
      question: "Using the variable 'test_array' containing [1, 2, 3], write code that returns the sum of all elements:"
    },
    {
      category: 'Enumerable',
      question: "Using the variable 'test_array' containing ['a', 'b', 'c'], write code that returns the first element that satisfies the block { |x| x > 'a' }:"
    }
  ]
end 