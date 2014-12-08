---
tags: symbols, keys, micro
languages: ruby
resources: 
---
# Ruby Symbols

As we've begun to work with hashes, you should already be familiar with the concept of a hash being a collection of key:value pairs:

```ruby
flatiron_school = {:instructors => ["Amanda", "Arel"], :placements => ["Jackie", "Joe"]}
```

Note that the key always starts with a colon (:). That isn't just convention; the key here a special type of object called a `symbol`. The symbol object in Ruby is the most basic Ruby object you can create.

Unlike a string, which is mutable (we can add and remove characters from strings), the symbol is immutable. Strings are meant to be changed and therefore, the space reserved for them in memory is larger. A symbol will always be the same size in memory, because they are immutable. 

### A Note about Ruby Versions >= 1.9

In Ruby 1.9, we were introduced with the option of foregoing the hash-rocket (`=>`) when writing key:value pairs, and instead express it like this:

```ruby
flatiron_school = {instructors: ["Amanda", "Arel"]}
```

Note that the key expressed like `instructors:` is still interpretted as a symbol by the compiler, and is actually converted to a hash-rocket when ran.