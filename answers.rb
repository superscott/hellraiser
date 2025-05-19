module QuizAnswers
  ANSWERS = [
    # String Questions
    {
      category: 'String',
      test_cases: [
        {
          setup: "test_string = 'hello world'",
          expected: "test_string.include?('lo')",
          explanation: "Using String#include? to check if a string contains a substring"
        }
      ]
    },
    {
      category: 'String',
      test_cases: [
        {
          setup: "test_string = 'hello world'",
          expected: "test_string.upcase",
          explanation: "Using String#upcase to convert the string to uppercase"
        }
      ]
    },
    {
      category: 'String',
      test_cases: [
        {
          setup: "test_string = '  trim me  '",
          expected: "test_string.strip",
          explanation: "Using String#strip to remove whitespace from both ends"
        }
      ]
    },
    {
      category: 'String',
      test_cases: [
        {
          setup: "test_string = 'hello,world'",
          expected: "test_string.split(',')",
          explanation: "Using String#split to create an array from a delimited string"
        }
      ]
    },
    {
      category: 'String',
      test_cases: [
        {
          setup: "test_string = 'hello world'",
          expected: "test_string.gsub('l', 'x')",
          explanation: "Using String#gsub to replace all occurrences of a character"
        }
      ]
    },
    {
      category: 'String',
      test_cases: [
        {
          setup: "test_string = 'hello world'",
          expected: "test_string.length",
          explanation: "Using String#length to get the number of characters"
        }
      ]
    },

    # Array Questions
    {
      category: 'Array',
      test_cases: [
        {
          setup: "test_array = [1, 2, 3]",
          expected: "test_array.pop",
          explanation: "Using Array#pop to remove and return the last element"
        }
      ]
    },
    {
      category: 'Array',
      test_cases: [
        {
          setup: "test_array = [1, 2, 2, 3, 3]",
          expected: "test_array.uniq",
          explanation: "Using Array#uniq to remove duplicate elements"
        }
      ]
    },
    {
      category: 'Array',
      test_cases: [
        {
          setup: "test_array = [3, 1, 4, 1, 5]",
          expected: "test_array.sort",
          explanation: "Using Array#sort to sort elements in ascending order"
        }
      ]
    },
    {
      category: 'Array',
      test_cases: [
        {
          setup: "test_array = [1, 2, 3]",
          expected: "test_array.push(4)",
          explanation: "Using Array#push to add an element to the end"
        }
      ]
    },
    {
      category: 'Array',
      test_cases: [
        {
          setup: "test_array = [1, 2, 3]",
          expected: "test_array.first",
          explanation: "Using Array#first to get the first element"
        }
      ]
    },
    {
      category: 'Array',
      test_cases: [
        {
          setup: "test_array = [1, 2, 3]",
          expected: "test_array.reverse",
          explanation: "Using Array#reverse to reverse the order of elements"
        }
      ]
    },

    # Hash Questions
    {
      category: 'Hash',
      test_cases: [
        {
          setup: "test_hash = {name: 'Ruby', type: 'language'}",
          expected: "test_hash.key?(:name)",
          explanation: "Using Hash#key? to check if the key exists"
        }
      ]
    },
    {
      category: 'Hash',
      test_cases: [
        {
          setup: "test_hash = {a: 1, b: 2}",
          expected: "test_hash.values",
          explanation: "Using Hash#values to get all values"
        }
      ]
    },
    {
      category: 'Hash',
      test_cases: [
        {
          setup: "test_hash = {a: 1, b: 2}",
          expected: "test_hash.keys",
          explanation: "Using Hash#keys to get all keys"
        }
      ]
    },
    {
      category: 'Hash',
      test_cases: [
        {
          setup: "test_hash = {a: 1}",
          expected: "test_hash.fetch(:a, 0)",
          explanation: "Using Hash#fetch to get a value with a default"
        }
      ]
    },
    {
      category: 'Hash',
      test_cases: [
        {
          setup: "test_hash = {a: 1, b: 2}",
          expected: "test_hash.merge({c: 3})",
          explanation: "Using Hash#merge to combine two hashes"
        }
      ]
    },
    {
      category: 'Hash',
      test_cases: [
        {
          setup: "test_hash = {a: 1, b: 2}",
          expected: "test_hash.empty?",
          explanation: "Using Hash#empty? to check if the hash has no key-value pairs"
        }
      ]
    },

    # Integer Questions
    {
      category: 'Integer',
      test_cases: [
        {
          setup: "test_number = 42",
          expected: "test_number.even?",
          explanation: "Using Integer#even? to check if the number is even"
        }
      ]
    },
    {
      category: 'Integer',
      test_cases: [
        {
          setup: "test_number = -5",
          expected: "test_number.abs",
          explanation: "Using Integer#abs to get the absolute value"
        }
      ]
    },
    {
      category: 'Integer',
      test_cases: [
        {
          setup: "test_number = 7",
          expected: "test_number.odd?",
          explanation: "Using Integer#odd? to check if the number is odd"
        }
      ]
    },
    {
      category: 'Integer',
      test_cases: [
        {
          setup: "test_number = 5",
          expected: "test_number.next",
          explanation: "Using Integer#next to get the next integer"
        }
      ]
    },
    {
      category: 'Integer',
      test_cases: [
        {
          setup: "test_number = 8",
          expected: "test_number.positive?",
          explanation: "Using Integer#positive? to check if the number is greater than zero"
        }
      ]
    },
    {
      category: 'Integer',
      test_cases: [
        {
          setup: "test_number = 10",
          expected: "test_number.to_f",
          explanation: "Using Integer#to_f to convert to floating-point number"
        }
      ]
    },

    # Enumerable Questions
    {
      category: 'Enumerable',
      test_cases: [
        {
          setup: "test_array = [1, 2, 3]",
          expected: "test_array.map { |n| n * 2 }",
          explanation: "Using Enumerable#map to transform each element"
        }
      ]
    },
    {
      category: 'Enumerable',
      test_cases: [
        {
          setup: "test_array = [1, 2, 3, 4, 5]",
          expected: "test_array.select { |n| n > 3 }",
          explanation: "Using Enumerable#select to filter elements"
        }
      ]
    },
    {
      category: 'Enumerable',
      test_cases: [
        {
          setup: "test_array = [1, 2, 3, 4]",
          expected: "test_array.any?(&:even?)",
          explanation: "Using Enumerable#any? to check if any element satisfies the condition"
        }
      ]
    },
    {
      category: 'Enumerable',
      test_cases: [
        {
          setup: "test_array = [2, 4, 6, 8]",
          expected: "test_array.all?(&:even?)",
          explanation: "Using Enumerable#all? to check if all elements satisfy the condition"
        }
      ]
    },
    {
      category: 'Enumerable',
      test_cases: [
        {
          setup: "test_array = [1, 2, 3]",
          expected: "test_array.reduce(:+)",
          explanation: "Using Enumerable#reduce to sum all elements"
        }
      ]
    },
    {
      category: 'Enumerable',
      test_cases: [
        {
          setup: "test_array = ['a', 'b', 'c']",
          expected: "test_array.find { |x| x > 'a' }",
          explanation: "Using Enumerable#find to get the first element matching the condition"
        }
      ]
    }
  ]
end 