# Ruby Symbols

## Objectives

1. Understand what a symbol is in Ruby.
2. Lean the usefulness of symbols as hash keys.

## What is a symbol? 

Let's look at the example below:

```
:i_am_a_symbol
```

Note that the keyword above starts with a colon (`:`). That isn't just convention; the keyword here is a special type of object called a "symbol". A symbol looks similar to a string, but with one primary distinction: a symbol can't be changed.

Strings are *mutable*, meaning that we can manipulate them in various ways of adding, removing, or replacing characters. Ruby accounts for that possible mutability by allocating more memory for it. Every time you create a string, it creates a new object in memory, even if the string text is identical. We can test this by asking an object for its `object_id`—a handle that Ruby uses to track it in memory. 

Drop into IRB to play around with the following code:

```ruby
name = 'Steven' 
same_as_name = 'Steven'

name.object_id == same_as_name.object_id
  #=> false

# Stored in 2 different locations in memory
```

The symbol, however, is **immutable**. What is an immutable object? It's simply an object whose state can't be modified after it is created. A symbol will always be the same size in memory because it is *immutable*. Unlike the string, the same symbol can be referenced many times. If you have multiple references to one symbol, all of those references will always point to the same object. You can verify this yourself in IRB:

``` ruby
name = :steven
same_as_name = :steven
name.object_id == same_as_name.object_id 
  #=> true
```

## Why Use Symbols as Hash Keys?

A hash is like a dictionary—it's a collection that can store data as "values" that are accessed by "keys". The keys are reference points. In other words, we use the keys to access the stored information (the values). Think of a hash like a storage unit. The keys are like the address or location of the storage unit and the values are like the content of the storage unit. Accordingly, we're not interested in manipulating the keys. We don't want to change the address, just use it to look up or access the contents. 

Keys do not need to be mutable. Since they don't need to be mutable, and since mutable objects like strings take up more space in memory, we use immutable, memory-saving symbols as hash keys. 

### A Note about Ruby Versions >= 1.9

In Ruby 1.9, we were introduced with the option of foregoing the hash-rocket (`=>`) when writing key/value pairs when the key is a symbol. Instead we can express it like this:

```ruby
flatiron_school = {instructor: "Isaac Newton"}
```

A key expressed like `instructor:` is still interpreted as a symbol by the interpreter and this syntax is understood in the same way as a hash-rocket when the program is run.
