require_relative "comma_parser"

puts "Welcome to the file parser"

# def parse_pipe_delimited
#   read_file("assets/pipe.txt", PIPE_DELIMITER)
# end


# def parse_space_delimited
#   read_file("assets/space.txt", SPACE_DELIMITER)
# end

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
  ].compact.join(" "))
end

[
  # parse_pipe_delimited,
  # parse_space_delimited,
  parse_comma_delimited
].flatten.sort{ |a, b| [a.gender, a.last_name] <=> [b.gender, b.last_name] }.map do |person|
  print_person(person)
end