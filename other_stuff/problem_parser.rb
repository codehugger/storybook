require 'byebug'
require 'treetop'

content = File.read(ARGV[0])

Treetop.load 'problem'

parser = PDDLProblemParser.new

puts parser.parse("(define (problem claim-camelot) (:domain something) (:objects camelot lake - place))")
puts parser.parse(content)

# # strip comments
# content = content.split("\n").select { |l| !(l.start_with?(";")) }
# content = content.join()
# content.gsub!("\n", "")

# definition = content.scan(/\(define(.*)\)/).join()
# domain     = definition.scan(/\(:domain(.*?)\)/).join()
# objects    = definition.scan(/\(:objects(.*?)\)/).join()
# init       = definition.scan(/\(:init(.*?)\)/).join()
# goal       = definition.scan(/\(:goal(.*?)\)/).join()

# byebug

# puts

# # puts "#{domain.map { |d| d.strip }}"
# # puts "-"*50
# # puts "#{objects.map { |d| d.strip }}"
# # puts "-"*50
# # puts "#{init.map { |d| d.strip }}"
# # puts "-"*50
# # puts "#{goal.map { |d| d.strip }}"
