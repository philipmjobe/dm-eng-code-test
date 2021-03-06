require "csv"
require "date"
require_relative "person"


class CommaParser
  attr_reader :file

  DELIMITER = ", "

  def initialize(file_path)
    @file = CSV.read(file_path, col_sep: DELIMITER)
  end

  
  def parse 
    file.map! { |row| row[4] = Date.strptime(row[4], "%m/%d/%Y"); row }
    file.sort_by! { |row| row[4] }
    file.map do |row|
      Person.new(
        last_name: row[0],
        first_name: row[1],
        gender: row[2],
        favorite_color: row[3],
        date_of_birth: row[4].strftime("%-m/%-d/%Y")
      )
    end
  end
end 