require 'benchmark'

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

def string_time
  hashes_with_strings = {
    "instructors" => {
      "ios" => ["Chris", "Zack", "Joe"],
      "ruby" => ["Ian", "Katie", "Uzo", "Mitch", "Steven", "Arel", "Tristan", "Amanda"],
      "front end" => ["Jon"],
      "android" => ["Al"],
      "kids" => ["Victoria", "Stephanie", "Danny", "Vanessa"]
    }
  }

  time = Benchmark.measure do
    100000.times do 
      hashes_with_strings["instructors"]["kids"].last
    end
  end
  puts "Time elapsed (in seconds) to access data with string keys:\n #{time}"
end

symbol_time
string_time