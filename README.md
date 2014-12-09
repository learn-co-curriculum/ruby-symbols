---
tags: symbols, strings, hashes, keys, micro
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

Note that the key starts with a colon (:). That isn't just convention; the key here a special type of object called a `symbol`. A `symbol` is closely related to a `string`

Strings are mutable, meaning we can add and remove characters from it. Ruby accounts for that possible mutability by allocating more memory for it. Everytime you create a string, it creates a new object in memory, even if the string text is identical. We can test this by asking an object for its `object_id`, a handle ruby uses to track it in memory:

```ruby
name = 'Steven' 
same_as_name = 'Steven'

name.object_id == same_as_name.object_id #=> false

# Stored in 2 differnt locations in memory
```

The symbol, however, is immutable. A symbol will always be the same size in memory, because they are immutable. Unlike the string, the same symbol can be referenced many times. If you have multiple references to one symbol , all of those references are pointing back to the same object. Don't take my word for it:

``` ruby
name = :steven
same_as_name = :steven
name.object_id == same_as_name.object_id #=> true
```

### A Note about Ruby Versions >= 1.9

In Ruby 1.9, we were introduced with the option of foregoing the hash-rocket (`=>`) when writing key:value pairs when the key is a symbol. Instead we can express it like this:

```ruby
flatiron_school = {instructors: ["Amanda", "Arel"]}
```

The key expressed like `instructors:` is still interpretted as a symbol by the interpreter, and is actually converted to a hash-rocket when run.

## Instructions

Go into `spec/ruby_symbols_spec.rb` and follow the instructions to get the tests to pass.

## Bonus Fun

Run `ruby lib/ruby_symbols.rb`. Don't worry too much about what's going on in this file; just know that we have two nearly identical hashes, one using strings as keys and one using symbols as keys, and we're performing a lookup on each hash 100000 times, as a stress test to get readable run-time numbers.

You should see something like this printed into your terminal:

```
Time elapsed (in seconds) to access data with symbol keys:
   0.010000   0.000000   0.010000 (  0.012226)
Time elapsed (in seconds) to access data with string keys:
   0.040000   0.000000   0.040000 (  0.039910)
```

The last time, which is in parentheses, is the one that's most telling. That's the real-time reading of the code's execution. Notice that the run-time for the symbols is nearly a third of the run-time for the strings.

Why?

Because strings are mutable and are expected to change and therefore have more memory allocated to them, referencing them requires more memory.
