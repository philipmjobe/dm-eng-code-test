class Person
  attr_reader :last_name, 
              :first_name, 
              :middle_initial, 
              :gender, 
              :date_of_birth, 
              :favorite_color

  def initialize(
    last_name:, 
    first_name:, 
    middle_initial: nil, 
    gender:, 
    date_of_birth:, 
    favorite_color:
  )
    @last_name = last_name
    @first_name = first_name
    @middle_initial = middle_initial
    @gender = gender
    @date_of_birth = date_of_birth
    @favorite_color = favorite_color
  end
end