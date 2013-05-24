class Classroom
  # Dependencies
  include Mongoid::Document

  # Relations
  embedded_in :school
  embedded_with_many :courses
  embedded_with_many :students, through: :courses
  embedded_with_many :teachers, through: :courses

  # Properties
  field :name, type: String

end # Classroom