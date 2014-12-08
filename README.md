---
tags: symbols, keys, micro, tutorial
languages: ruby
resources: 
---
# Ruby Symbols

As we've begun to work with hashes, you should already be familiar with the concept of a hash being a collection of key:value pairs:

```ruby
flatiron_school = {
  :instructors => ["Amanda", "Arel"], 
  :placements => ["Jackie", "Joe"]
}
```

Note that the key always starts with a colon (:). That isn't just convention; the key here a special type of object called a `symbol`. The symbol object in Ruby is the most basic Ruby object you can create.

The string is mutable: we can add and remove characters from strings and Ruby accounts for that possible mutability by allocating more memory to the string. Additionally, if you program as multiple references to one string ("name") each string is a separate String object, even though the string is identical.

The symbol, however, is immutable. A symbol will always be the same size in memory, because they are immutable. Unlike the string, the same symbol can be referenced many times. If you have multiple references to one symbol (:name), all of those references are pointing back to the same object.

### A Note about Ruby Versions >= 1.9

In Ruby 1.9, we were introduced with the option of foregoing the hash-rocket (`=>`) when writing key:value pairs, and instead express it like this:

```ruby
flatiron_school = {instructors: ["Amanda", "Arel"]}
```

That the key expressed like `instructors:` is still interpretted as a symbol by the compiler, and is actually converted to a hash-rocket when ran.

## Instructions

In `lib/ruby_symbols.rb`, you'll find two methods, both of which use the `benchmark` module that comes with Ruby. Benchmark helps measure and report the time the compiler takes to execute Ruby code. We're going to be using a method `.measure`.

Don't worry if the details of what these methods are doing are confusing. They use blocks that you might not be familiar with yet.

Let's take a look. In the first method `symbol_time`, we're:
1. Defining a hash that uses symbols as keys
2. Executing a lookup on the hash (`hash_with_symbols[:instructors][:kids].last`) `100000.times` (to stress the system)
3. `puts`ing to the console the time.

```ruby
def symbol_time
  hash_with_symbols = {
    :instructors => {
      :ios => ["Chris", "Zack", "Joe"],
      :ruby => ["Ian", "Katie", "Uzo", "Mitch", "Steven", "Arel", "Tristan", "Amanda"],
      :front_end => ["Jon"],
      :android => ["Al"],
      :kids => ["Victoria", "Stephanie", "Danny", "Vanessa"]
    }
  }

  time = Benchmark.measure do
    100000.times do 
      hash_with_symbols[:instructors][:kids].last
    end
  end
  puts "Time elapsed (in seconds) to access data with symbol keys:\n #{time}"
end
```

And then we're doing the same with another hash, with identical data, where instead of symbols the keys are strings.

Lastly, at the bottom of the file, we're calling both methods.

Go ahead and run `ruby lib/ruby_symbols.rb`.

You should see something like this printed into your terminal:

```bash
Time elapsed (in seconds) to access data with symbol keys:
   0.010000   0.000000   0.010000 (  0.012226)
Time elapsed (in seconds) to access data with string keys:
   0.040000   0.000000   0.040000 (  0.039910)
```

The time might vary depending on how fast your computer is.

The last time, which is in parentheses, is the one that's most telling. That's the real-time reading of the code's execution. Notice that the run-time for the symbols is nearly a third of the run-time for the strings.

Why?

Like discussed above, compilers allocate more memory for the string keys than the symbol keys, and because we're running the lookup 100000 times, each time it must reference a new "string" object. That takes up time too.

Feel free to play around with `lib/ruby_symbols.rb` to see how long other code takes to run.