require_relative "pipe_parser"
require_relative "space_parser"
require_relative "comma_parser"

puts "Welcome to the file parser"
puts
puts "I am going to show you something amazing! Would you like to see?"
response = gets.chomp 

if response == "No"
  puts "Fine be that way."
  clear 
end 

def parse_pipe_delimited
  PipeParser.new("assets/pipe.txt").parse
end


def parse_space_delimited
  SpaceParser.new("assets/space.txt").parse 
end

def parse_comma_delimited
  CommaParser.new("assets/comma.txt").parse
end


def print_person(person)
  puts([
    person.last_name,
    person.first_name,
    person.middle_initial,
    person.gender,
    person.date_of_birth,
    person.favorite_color
  ].values_at(0, 1, 3, 4, 5).compact.join(" "))
end


[
  parse_pipe_delimited,
  parse_space_delimited,
  parse_comma_delimited
].flatten.sort{ |a, b| [a.gender, a.last_name] <=> [b.gender, b.last_name] }.map do |person|
  print_person(person)
 end

puts 
[
  parse_pipe_delimited,
  parse_space_delimited,
  parse_comma_delimited
].flatten.sort{ |a, b| [a.date_of_birth, a.last_name] <=> [b.date_of_birth, b.last_name] }.map do |person|
  print_person(person)
end
puts 
[
  parse_pipe_delimited,
  parse_space_delimited,
  parse_comma_delimited
].flatten.sort{ |a, b| [a.last_name] <=> [b.last_name] }.reverse.map do |person|
  print_person(person)
end