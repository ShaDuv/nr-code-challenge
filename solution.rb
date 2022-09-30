#!/usr/bin/ruby
# The program ignores punctuation, line endings, and is case insensitive
# The program outputs a list of the 100 most common three word sequences in the text, along with a count of how many times each occurred in the text.
# For example: 231 - i will not, 116 - i do not, 105 - there is no, 54 - i know not, 37 - i am not

def clean_text(text)
    return text.gsub(/[[:punct:]]/, "").downcase.split(" ")
  end
  
  def group(data)
    triplets = {}
    i = 0
  
    while i + 3 <= data.length
      phrase = data[i...i + 3].join(" ")
  
      if triplets[phrase]
        triplets[phrase] += 1
      else
        triplets[phrase] = 1
      end
      i += 1
    end
    return triplets
  end
  
  def top_values(triplets)
    output = []
    max = triplets.values.max(100).uniq
  
    max.each do |n|
      output << "#{n} - #{triplets.key(n)}"
    end
    return output
  end
  
  if ARGV.length > 0
    ARGV.map do |filename| # Accepts as arguments a list of one or more file paths (e.g. ./solution.rb file1.txt file2.txt ...).
      puts "----- starting #{filename} -----"
      puts top_values(group(clean_text(File.read(filename))))
      puts "----- #{filename} complete -----"
    end
  else
    puts top_values(group(clean_text(STDIN.read)))    # Accepts input on stdin (e.g. cat file1.txt | ./solution.rb).
  end
  