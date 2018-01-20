##
##  main.rb
##  Lexis
##
##  A Ruby script that reads text supplied in a separate file, analyses it for various patterns and
##  statistics, and prints out the results for the user.
##
##  Created on January 21, 2018 by Animesh Mishra <hello@animesh.ltd>
##  © 2018 Animesh Ltd
##  
##  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except 
##  in compliance with the License bundled with the application.
##
##  Unless required by applicable law or agreed to in writing, software distributed under the License 
##  is distributed on an "as is" basis without warranties or conditions of any kind, either express or 
##  implied. See the License for the specific language governing permissions and limitations under the 
##  License.
##

# More about stop words here: http://en.wikipedia.org/wiki/Stop_words
stopWords   = File.readlines("Content/StopWords.txt").join
fileName    = "Oliver_Twist.txt"
lines       = File.readlines("Content/" + fileName)
text        = lines.join 

# Count the lines, words, sentences and paragraphs
lineCount           = lines.size
charCount           = text.length
charCountExclSpaces = text.gsub(/\s+/, '').length
wordCount           = text.split.length
sentenceCount       = text.split(/\.|\?|!/).length
paraCount           = text.split(/\n\n/).length

# Percentage of good words, i.e. non-stop words
allWords    = text.split
goodWords   = allWords.reject { |word| stopWords.include?(word) }
goodPercent = (goodWords.length.to_f / allWords.length.to_f) * 100 

# Report analysis
puts "Lines".ljust(30)                      + "#{lineCount}".rjust(10)
puts "Characters".ljust(30)                 + "#{charCount}".rjust(10) 
puts "Characters without spaces".ljust(30)  + "#{charCountExclSpaces}".rjust(10)
puts "Words".ljust(30)                      + "#{wordCount}".rjust(10)
puts "Sentences".ljust(30)                  + "#{sentenceCount}".rjust(10)
puts "Paragraphs".ljust(30)                 + "#{paraCount}".rjust(10)

puts "\n========= Averages =========\n"
puts "Sentences per paragraph".ljust(30)    + "%.2f".rjust(10) % (sentenceCount.to_f / paraCount.to_f)
puts "Words per paragraph".ljust(30)        + "%.2f".rjust(10) % (wordCount.to_f / sentenceCount.to_f)
puts "Fluff words".ljust(30)                + "%d%%".rjust(10) % (100 - goodPercent).to_i