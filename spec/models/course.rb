class Course
  # Dependencies
  include Mongoid::Document
  include Mongoid::EmbeddedWith

  # Relations
  embedded_in :school
  embedded_with_many :classrooms
  embedded_with_many :students
  embedded_with_many :teachers

  # Properties
  field :name, type: String

end # Course