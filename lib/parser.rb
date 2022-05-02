require 'csv'

PIPE_DELIMITER = " | "
SPACE_DELIMITER = " "
COMMA_DELIMITER = ", "

puts "Welcome to the file parser"


def read_file(file, delimiter)
  CSV.read(file, col_sep: delimiter).map do |row|
    {
      last_name: row[0],
      first_name: row[1],
      middle_initial: row[2],
      gender: row[3],
      date_of_birth: row[4],
      favorite_color: row[5]
    }
  end
end

def parse_pipe_delimited
  read_file("assets/pipe.txt", PIPE_DELIMITER)
end


def parse_space_delimited
  read_file("assets/space.txt", SPACE_DELIMITER)
end

def parse_comma_delimited
  read_file("assets/comma.txt", COMMA_DELIMITER)
end


def print_person(person)
  puts "#{person[:last_name]} #{person[:first_name]} #{person[:middle_initial]} #{person[:gender]} #{person[:date_of_birth]} #{person[:favorite_color]}"
end

[
  parse_pipe_delimited,
  parse_space_delimited,
  parse_comma_delimited
].flatten.sort{ |a, b| [a[:gender], a[:last_name]] <=> [b[:gender], b[:last_name]] }.map do |person|
  print_person(person)
end