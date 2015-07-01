# Ruby Symbols

## Objectives

1. Understand what a symbol is 
2. Understand why we use symbols as hash keys

## What is a symbol? 

Let's look at the example below:

```
:i_am_a_symbol
```

Note that the the keyword above starts with a colon (`:`). That isn't just convention; the keyword here is a special type of object called a `symbol`. A `symbol` is closely related to a `string`.

**Strings are mutable**, meaning we can add and remove characters from it. Ruby accounts for that possible mutability by allocating more memory for it. Everytime you create a string, it creates a new object in memory, even if the string text is identical. We can test this by asking an object for its `object_id`, a handle ruby uses to track it in memory. 

Drop into IRB to play around with the following code:

```ruby
name = 'Steven' 
same_as_name = 'Steven'

name.object_id == same_as_name.object_id
  #=> false

# Stored in 2 differnt locations in memory
```

The symbol, however, is **immutable**. What is an immutable object? It's simply an object whose state can't be modified after it is created. A symbol will always be the same size in memory, because they are immutable. Unlike the string, the same symbol can be referenced many times. If you have multiple references to one symbol , all of those references are pointing back to the same object. Don't take my word for it:

``` ruby
name = :steven
same_as_name = :steven
name.object_id == same_as_name.object_id 
  #=> true
```


## Why Use Symbols as Hash Keys?

A hash is like a dictionary––it's a place where we store data called  "values" in reference points called "keys". The keys are look up points. In other words, we use the keys to access the stored information, or values. Think of a hash like a storage unit. The keys are like the address or location of the storage unit and the values are like the content of the storage unit. Accordingly, we're not interested in manipulating the keys. We don't want to change the address, just use it to look up or access the contents. 

Keys do not need to be mutable. Since they don't need to be mutable, and since mutable objects like string take up more space in memory, we use immutable, memory saving symbols as hash keys. 

### A Note about Ruby Versions >= 1.9

In Ruby 1.9, we were introduced with the option of foregoing the hash-rocket (`=>`) when writing key:value pairs when the key is a symbol. Instead we can express it like this:

```ruby
flatiron_school = {instructor: "Isaac Newton"}
```

The key expressed like `instructor:` is still interpreted as a symbol by the interpreter, and is actually converted to a hash-rocket when the program is run.
